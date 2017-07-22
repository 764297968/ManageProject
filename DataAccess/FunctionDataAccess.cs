﻿using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    /// <summary>
    /// 功能
    /// </summary>
    public class FunctionDataAccess
    {
        /// <summary>
        /// 获取功能
        /// </summary>
        /// <returns></returns>
        public List<FunctionViewModel> GetFunctionList()
        {
            List < FunctionViewModel > list= new List<FunctionViewModel>();
            var db = new SuperDBEntities();
            db.Function.Add(new Function() {
                FunctionName="测试",
                PageURL="www.baidu.com",
                Description=""
            });
            db.FunctionGroup.Add(new FunctionGroup()
            {
                GroupName = "系统管理"
            });
            db.SaveChanges();
            var data=new SuperDBEntities().Function.ToList();
            foreach (var item in data)
            {
                list.Add(new FunctionViewModel().EntityToViewModel(item));
            }
            return list;
        }
    }
}