using ServiceStack.OrmLite;
using System;
using ServiceStack.Data;
using System.Collections.Generic;
using System.Data;
using ServiceStack.Templates;

namespace TemplateWebsites
{
    public class DbTemplateFilters : TemplateFilter
    {
        public IDbConnectionFactory DbFactory { get; set; }
        T exec<T>(Func<IDbConnection,T> fn)
        {
            using (var db = DbFactory.Open())
            {
                return fn(db);
            }
        }

        public object dbSelect(string sql) => exec(db => db.Select<Dictionary<string,object>>(sql));
        public object dbSelect(string sql, Dictionary<string,object> args) => exec(db => db.Select<Dictionary<string,object>>(sql,args));
        public object dbSingle(string sql) => exec(db => db.Single<Dictionary<string,object>>(sql));
        public object dbSingle(string sql, Dictionary<string,object> args) => exec(db => db.Single<Dictionary<string,object>>(sql,args));
        public object dbScalar(string sql) => exec(db => db.Scalar<object>(sql));
        public object dbScalar(string sql, Dictionary<string,object> args) => exec(db => db.Scalar<object>(sql,args));
    }
}
