//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class MyLogger
    {
        public int LogId { get; set; }
        public Nullable<int> Event_Type { get; set; }
        public string TIMESTAMP { get; set; }
        public string EventCategory { get; set; }
        public Nullable<int> Event_ID { get; set; }
        public string ComputerName { get; set; }
        public string Mac_Address { get; set; }
        public string UserName { get; set; }
        public string SourceUrl { get; set; }
        public string Source { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> CollectDate { get; set; }
    }
}