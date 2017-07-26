﻿using Entity;
using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using Utility;
using Utility.Cache;
using ViewModel;

namespace AdminWeb.Controllers
{
    public class AddressController : Controller
    {
        static AddressLogic addressLogic = new AddressLogic();
        // GET: Address
        public ActionResult Index(string url="")
        {
            if(url=="")
            {
                url = "http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/index.html";
                //url = "http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/11.html";
            }
            var lstImg= GetHtml(url);
            //List<HtmlInfo> list= xh.Descendants("a");
            //List<HtmlInfo> alist= list.ChildDescendants("a");
            string html = HttpHelper.Get(url);
            Log4net.LogHelper.WriteLog("gethtml", html);
            return View(lstImg);
        }
        private static List<string> GetHtml(string url)
        {
            
            List<string> lstImg = new List<string>();
            var obj=CacheHelper.Get("address");
            if (obj==null)
            {
                CacheHelper.AddPermanent("address", lstImg);
                obj = lstImg;
            }
            string html = HttpHelper.Get(url);
            if (html == "err")
                throw new Exception();
            Regex reg = new Regex("<tr class='(.*?)'>(.*?)</tr>", RegexOptions.IgnoreCase);
            MatchCollection matches = reg.Matches(html);
            foreach (Match match in matches)
            {
                
                Regex hrefReg = new Regex("<a href='(.*?)'>");
                Regex phrefReg = new Regex("<a href='(.*?)'>(.*?)</a>");
                MatchCollection hrefs = phrefReg.Matches(match.Value);
                if (match.Value.IndexOf(EnumEntity.AddressType.provincetr.ToString()) >-1)
                {
                    foreach (Match hrefm in hrefs)
                    {
                        //(obj as List<string>).Add(hrefm.Value);
                        Address_Province address = new Entity.Address_Province();
                        string[] hrefarr = hrefm.Value.Replace("<a href='", "").Replace("'>", ";").Replace("<br/></a>", "").Split(';');
                        address.ProvinceCode = hrefarr[0];
                        address.ProvinceName = hrefarr[1];
                        addressLogic.AddDbProvince(address);
                        if (!string.IsNullOrWhiteSpace(hrefm.Value))
                        {
                            GetHtml(url.Substring(0, url.LastIndexOf('/') + 1) + hrefarr[0]);
                            int result = addressLogic.SaveDbAddress();
                            Log4net.LogHelper.WriteLog("地址采集入库", result, address);
                        }
                    }
                }
                else if(match.Value.IndexOf("villagetr") > -1)
                {

                    Regex tdReg = new Regex("<td>(.*?)</td>");
                    MatchCollection hmatchs = tdReg.Matches(match.Value);
                    string[] hrefarr = new string[2];
                    hrefarr[0] = hmatchs[0].Value.Substring("<td>".Length,12);
                    hrefarr[1] = hmatchs[2].Value.Substring("<td>".Length, hmatchs[2].Value.IndexOf("</td>")- "<td>".Length);

                    AddressBase address = new Entity.AddressBase();
                    address.Code = hrefarr[0];
                    address.Text = hrefarr[1];
                    address.Type = match.Value.Substring("<tr class='".Length, match.Value.IndexOf("'>") - "<tr class='".Length);
                    addressLogic.AddDbAddress(address);
                }
                else
                {
                    if(hrefs.Count!=0)
                    {
                        string[] hrefarr = new string[2];
                        hrefarr[0] = hrefs[0].Value.Replace("<a href='", "").Replace("'>", ";").Replace("</a>", "").Split(';')[1];
                        hrefarr[1] = hrefs[1].Value.Replace("<a href='", "").Replace("'>", ";").Replace("</a>", "").Split(';')[1];
                        Match hmatch = hrefReg.Match(match.Value);
                        AddressBase address = new Entity.AddressBase();
                        address.Code = hrefarr[0];
                        address.Text = hrefarr[1];
                        address.Type = match.Value.Substring("<tr class='".Length, match.Value.IndexOf("'>") - "<tr class='".Length);
                        addressLogic.AddDbAddress(address);
                       
                        if (!string.IsNullOrWhiteSpace(hmatch.Value))
                        {
                            GetHtml(url.Substring(0, url.LastIndexOf('/') + 1) + hmatch.Value.Replace("<a href='", "").ToString().Replace("'>", ""));
                            int result=addressLogic.SaveDbAddress();
                            Log4net.LogHelper.WriteLog("地址采集入库", result, address);
                        }
                    }
                    
                }
                
                
            }

            return obj as List<string>;
        }
    }
}