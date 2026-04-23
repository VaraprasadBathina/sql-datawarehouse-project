/*
-----------------------------------------------------------------------------
STORED PROCEDURE TO BULK LOAD ALL THE DATA FROM CSV FILES TO DATABASE TABLES
-----------------------------------------------------------------------------



CREATE OR ALTER PROCEDURE bronze.bronze_load AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '========================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '========================';


		PRINT '------------------------';
		PRINT 'LOADING CRM TABLES';
		PRINT '------------------------';

		SET @start_time = GETDATE();
		PRINT '>>>TRUNCATE EXISTING crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info
		PRINT '>>>BULK INSERTING crm_cust_info RECORDS';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR)

		PRINT '>>>TRUNCATE EXISTING crm_prd_info table';
		TRUNCATE TABLE bronze.crm_prd_info
		PRINT '>>>BULK INSERTING crm_prd_info RECORDS';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);


		PRINT '>>>TRUNCATE EXISTING crm_sales_details table';
		TRUNCATE TABLE bronze.crm_sales_details
		PRINT '>>>BULK INSERTING crm_sales_details RECORDS';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '------------------------';
		PRINT 'LOADING ERP TABLES';
		PRINT '------------------------';


		PRINT '>>>TRUNCATE EXISTING bronze.erp_cust_az12 table';
		TRUNCATE TABLE bronze.erp_cust_az12
		PRINT '>>>BULK INSERTING bronze.erp_cust_az12 RECORDS';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);



		PRINT '>>>TRUNCATE EXISTING bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101
		PRINT '>>>BULK INSERTING bronze.erp_loc_a101 RECORDS';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);



		PRINT '>>>TRUNCATE EXISTING bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2
		PRINT '>>>BULK INSERTING bronze.erp_px_cat_g1v2 RECORDS';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\SQL_WareHouseProject_files\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW =2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT '============================'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER' + cast(ERROR_NUMBER() AS NVARCHAR());
		PRINT 'ERROR STATE' + cast(ERROR_STATE() AS NVARCHAR());
		PRINT '============================'
	END CATCH
END



*/
