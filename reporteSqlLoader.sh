#!/usr/bin/ksh
###################################################################
# PROGRAM:             Reporte Servicio SAP
# AUTHOR:               Elys Rivero. Mega Soft Computacion
# DATE:                      Jun/2010
# DESCRIPTION:     Realiza un reporte de las invocaciones realizadas a los servicios ConsultaImeiSAP y CambioImeiSAP. (VYPV)
###################################################################

export today=`date '+%y%m%d'`

cd /integration/bea/user_projects/applications/VYPV_WSConsultaIMEISAP

sqlldr VYPV_REPORTESAP/digitel@10.27.31.67:1527/PORTAL9I control=control.par log=reporte.rpt errors=1000000 bindsize=1000000 rows=100000 silent=feedback

mv reporte.rpt historial/reporte_$today.rpt

if [ -s sqlLoader.bad ] 
	then
		mv sqlLoader.bad historial/sqlLoader_$today.bad
fi

cat /dev/null > sqlLoader.dat