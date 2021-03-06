﻿using Log4net;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace DataAccess
{
    public static class DataRepository
    {
        public static DbContext DB
        {
            get
            {
                return EFContextFactory.GetCurrentDbContext();
            }
        }
        /// <summary>
        /// 分页
        /// </summary>
        /// <typeparam name="T">实体类型</typeparam>
        /// <typeparam name="S">排序字段的类型</typeparam>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">页数</param>
        /// <param name="sort">排序</param>
        /// <param name="IsAsc">是否倒序</param>
        /// <param name="predicate">条件</param>
        /// <param name="totalCount">总页数</param>
        /// <returns></returns>
        public static List<T> PageList<T, S>(int pageIndex, int pageSize, Expression<Func<T, S>> sort, bool IsAsc, Expression<Func<T, bool>> predicate, out int totalCount) where T : class
        {

            IQueryable<T> data = null;
            if (predicate != null)
            {
                if (IsAsc)
                    data = DB.Set<T>().OrderBy(sort).Where(predicate);
                else
                    data = DB.Set<T>().OrderByDescending(sort).Where(predicate);
            }
            else
            {
                if (IsAsc)
                    data = DB.Set<T>().OrderBy(sort);
                else
                    data = DB.Set<T>().OrderByDescending(sort);
            }

            totalCount = data.Count();
            return data.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }

        public static int Add<T>(T t) where T : class
        {
            try
            {
                DB.Set<T>().Add(t);
                int result= DB.SaveChanges();
               
                LogHelper.WriteLog("Add:"+t.GetType(),"结果:"+result.ToString()+";"+t.ObjectToJson());
                return result;
            }
            catch (Exception ex)
            {
                ErrorLogHelper.WriteLog(ex);
                return 0;
            }
        }
        public static int Delete<T>(T t) where T : class
        {
            try
            {
                DB.Set<T>().Remove(t);
                int result = DB.SaveChanges();

                LogHelper.WriteLog("Delete" + t.GetType(), result.ToString() + t.ObjectToJson());
                return result;
            }
            catch (Exception ex)
            {
                ErrorLogHelper.WriteLog(ex);
                return 0;
            }
        }
        public static int DeleteRange<T>(IEnumerable<T> ts) where T : class
        {
            try
            {
                DB.Set<T>().RemoveRange(ts);
                int result = DB.SaveChanges();

                LogHelper.WriteLog("Delete" + ts.GetType(), result.ToString() + ts.ObjectToJson());
                return result;
            }
            catch (Exception ex)
            {
                ErrorLogHelper.WriteLog(ex);
                return 0;
            }
        }

        
        public static int Update<T>(T t, string Id) where T : class
        {

            if (Id != null)
            {
                try
                {
                    DbEntityEntry<T> entry = DB.Entry<T>(t);
                    return DB.SaveChanges();
                }
                catch (Exception ex)
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }
        public static int UpdateEntityFields<T>(T entity, List<string> fileds) where T : class
        {
            if (entity != null && fileds != null)
            {
                try
                {

                    DB.Set<T>().Attach(entity);
                    var SetEntry = ((IObjectContextAdapter)DB).ObjectContext.
                        ObjectStateManager.GetObjectStateEntry(entity);
                    foreach (var t in fileds)
                    {
                        SetEntry.SetModifiedProperty(t);
                    }
                    return DB.SaveChanges();

                }
                catch (Exception ex)
                {
              
                    return 0;
                }
            }
            return 0;
        }
        public static void UpdateSetEntityFields<T>(T entity, List<string> fileds) where T : class
        {
            if (entity != null && fileds != null)
            {


                DB.Set<T>().Attach(entity);
                var SetEntry = ((IObjectContextAdapter)DB).ObjectContext.
                    ObjectStateManager.GetObjectStateEntry(entity);
                foreach (var t in fileds)
                {
                    SetEntry.SetModifiedProperty(t);
                }
            }
        }

    }
}
