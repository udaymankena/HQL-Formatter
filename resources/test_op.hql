DROP TABLE prod_use_case_5_enc.prscbr_addtnl ;
 
 CREATE TABLE prod_use_case_5_enc.prscbr_addtnl
 STORED AS orc TBLPROPERTIES ("orc.compress"="SNAPPY")
 AS SELECT rxc_prscbr_id,
 rxc_prscbr_addr_id,
 max(wrtn_dt) last_rx_wrtn_dt,
 count(distinct store_nbr, rx_nbr) rx_count
 FROM (select rxc_prscbr_id, rxc_prscbr_addr_id, wrtn_dt, store_nbr, rx_nbr, row_number() OVER (partition BY store_nbr, rx_nbr ORDER BY last_upd_dt desc) AS rownum FROM cvs_rtl_rx_enc.cvsrxdw_prescription) t
 WHERE rownum=1
 GROUP BY rxc_prscbr_id, rxc_prscbr_addr_id;
 