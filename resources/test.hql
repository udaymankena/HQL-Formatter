drop table prod_use_case_5_enc.prscbr_addtnl ;

create table prod_use_case_5_enc.prscbr_addtnl
stored as orc tblproperties ("orc.compress"="SNAPPY")
as select rxc_prscbr_id,
rxc_prscbr_addr_id,
max(wrtn_dt) last_rx_wrtn_dt,
count(distinct store_nbr, rx_nbr) rx_count
from (select rxc_prscbr_id, rxc_prscbr_addr_id, wrtn_dt, store_nbr, rx_nbr, row_number() over (partition by store_nbr, rx_nbr order by last_upd_dt desc) as rownum from cvs_rtl_rx_enc.cvsrxdw_prescription) t
where rownum=1
group by rxc_prscbr_id, rxc_prscbr_addr_id;
