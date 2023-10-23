Public Class DailyCollectionModel
    Friend Function getMasterData(DateFilter As Date) As DataTable

        Dim str As String = ""
        If AuthUserType = "ADMIN" And LoginUserID <> "2105" Then
            str = " AND user_id = '" & LoginUserID & "'"
        Else
            str = " "
        End If

        Dim sql As String = ""
        sql = "


   SELECT
	 id,
	 std_number,
	 transaction_date,
	-- receipt_no,
    -- CAST(receipt_no AS INTEGER) 'receipt_no',
     IF(receipt_no + 0, receipt_no + 0, 9999999)'receipt_no',
	 payee,
	 COURSEYEAR,
     particulars,
	 amount,
	 payment_type

		FROM(									
					SELECT	
						id,
						std_number,
						transaction_date,
						receipt_no,
						CASE WHEN display_name IS NULL THEN `title` ELSE display_name END AS 'payee',
						CASE WHEN `COURSEYEAR` IS NULL THEN `address` ELSE `COURSEYEAR` END AS 'COURSEYEAR',
						amount,
						particulars,
						payment_type,
                        user_id
					FROM(SELECT
							finance_transactions.id,
							students.std_number,
							finance_transactions.transaction_date, 
							finance_transactions.receipt_no, 
							SUBSTRING(finance_transactions.title,17)'title', 
							finance_transactions.address,
							person.display_name,
							CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR', 
							SUM(finance_transactions.amount)'amount',
							(SELECT DISTINCT
							finance_transaction_categories.`name`
						FROM
							finance_transaction_categories
						WHERE
							finance_transaction_categories.id = finance_transactions.category_id) 'particulars',
							finance_transactions.payment_type,
                            finance_transactions.user_id
						FROM
							finance_transactions
							-- INNER JOIN finance_fee_categories ON finance_transactions.category_id = finance_fee_categories.id
							LEFT JOIN students ON finance_transactions.student_id = students.id
							LEFT JOIN person ON students.person_id = PERSON.person_id
							LEFT JOIN batches ON students.batch_id = batches.id
							LEFT JOIN courses ON students.course_id = courses.id
							
						WHERE
							payment_type = 1 AND transaction_date = '" & Format(DateFilter.Date, "yyyy-MM-dd") & "' 
						GROUP BY finance_transactions.category_id,title
						ORDER BY finance_transactions.title
						)A
								
								
					UNION all
								
								
						SELECT
						id,
						std_number,
						transaction_date,
						receipt_no,
						payee,
						`COURSEYEAR`,
						amount,
						particulars,
						payment_type,
                        user_id
						FROM(SELECT 
									finance_transactions.id
									, students.std_number
									, finance_transactions.transaction_date
									, finance_transactions.receipt_no
									,  person.display_name 'payee'
									, CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR'   
									, SUM(`finance_transactions_onetime_payments`.`amount`)'amount'
									, `finance_fee_categories`.`name` 'particulars'
									, finance_transactions.payment_type
                                    , finance_transactions.user_id
							FROM
									`djemfcst_v2`.`students`
									INNER JOIN `djemfcst_v2`.`person` 
											ON (`students`.`person_id` = `person`.`person_id`)
									INNER JOIN `djemfcst_v2`.`finance_transactions` 
											ON (`finance_transactions`.`student_id` = `students`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_transactions_onetime_payments` 
											ON (`finance_transactions_onetime_payments`.`finance_transaction_id` = `finance_transactions`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_fee_particulars` 
											ON (`finance_transactions_onetime_payments`.`finance_fee_paticulars_id` = `finance_fee_particulars`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_fee_categories` 
											ON (`finance_fee_particulars`.`finance_fee_category_id` = `finance_fee_categories`.`id`)
									INNER JOIN `djemfcst_v2`.`batches` 
											ON (`students`.`batch_id` = `batches`.`id`)
									 INNER JOIN `djemfcst_v2`.`courses` 
											ON (`batches`.`course_id` = `courses`.`id`)     
											
							 WHERE finance_transactions.payment_type=0 AND transaction_date = '" & Format(DateFilter.Date, "yyyy-MM-dd") & "'
							 
							GROUP BY finance_fee_categories.id,display_name
							 
							ORDER BY display_name
							)B										
					)C		
					 -- WHERE transaction_date = '" & Format(DateFilter.Date, "yyyy-MM-dd") & "' 
                       " & str & "
					   ORDER BY receipt_no ASC
                       -- CAST(receipt_no AS INTEGER) ASC
                      ,payee,payment_type  

"
        Return DataSource(sql)

    End Function

    Public dt_colletction As DataTable
    Friend Function CheckCollection(id As Integer) As Boolean
        Dim dt As DataTable
        dt = DataSource(String.Format("SELECT
	finance_fee_particulars.description 'PARTICULAR FEE',
	finance_transactions_onetime_payments.amount 'FEE AMOUNT'
FROM
	finance_transactions_onetime_payments
	INNER JOIN finance_fee_particulars ON finance_transactions_onetime_payments.finance_fee_paticulars_id = finance_fee_particulars.id 
WHERE
	finance_transactions_onetime_payments.finance_transaction_id = '" & id & "'"))

        If dt.Rows.Count > 0 Then
            dt_colletction = dt.Copy
            Return True
        Else
            dt_colletction = dt.Copy
            Return False
        End If

    End Function

    Friend Function getIncomeData(DateFilter As String, nameOfPayee As String, nameParticular As String, receipt_no As String) As Object
        Dim sql As String = ""
        sql = "SELECT					
	IFNULL(FORMAT(amount,2),0)'amount'
FROM(SELECT
		finance_transactions.id,
		students.std_number,
		finance_transactions.transaction_date, 
		finance_transactions.receipt_no, 
		SUBSTRING(finance_transactions.title,17)'title', 
		finance_transactions.address,
		person.display_name,
		CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR', 
		SUM(finance_transactions.amount)'amount',
		(SELECT DISTINCT
		finance_transaction_categories.`name`
	FROM
		finance_transaction_categories
	WHERE
		finance_transaction_categories.id = finance_transactions.category_id) 'particulars',
		finance_transactions.payment_type
	FROM
		finance_transactions
		-- INNER JOIN finance_fee_categories ON finance_transactions.category_id = finance_fee_categories.id
		LEFT JOIN students ON finance_transactions.student_id = students.id
		LEFT JOIN person ON students.person_id = PERSON.person_id
		LEFT JOIN batches ON students.batch_id = batches.id
		LEFT JOIN courses ON students.course_id = courses.id
		
	WHERE
		payment_type = 1 AND transaction_date = '" & DateFilter & "'
	GROUP BY finance_transactions.category_id,title
	ORDER BY finance_transactions.title
	)A   
		WHERE particulars  = '" & nameParticular & "'
		AND display_name = '" & nameOfPayee & "'
        AND receipt_no = '" & receipt_no & "'
       "

        Return DataObject(sql)
    End Function

    Friend Function getFeesData(DateFilter As String, nameOfPayee As String, nameParticular As String, receipt_no As String) As Object
        Dim sql As String = ""
        sql = "SELECT 
		IFNULL(FORMAT(SUM(`finance_transactions_onetime_payments`.`amount`),2),0)'amount'
	FROM
		`djemfcst_v2`.`students`
		INNER JOIN `djemfcst_v2`.`person` 
				ON (`students`.`person_id` = `person`.`person_id`)
		INNER JOIN `djemfcst_v2`.`finance_transactions` 
				ON (`finance_transactions`.`student_id` = `students`.`id`)
		INNER JOIN `djemfcst_v2`.`finance_transactions_onetime_payments` 
				ON (`finance_transactions_onetime_payments`.`finance_transaction_id` = `finance_transactions`.`id`)
		INNER JOIN `djemfcst_v2`.`finance_fee_particulars` 
				ON (`finance_transactions_onetime_payments`.`finance_fee_paticulars_id` = `finance_fee_particulars`.`id`)
		INNER JOIN `djemfcst_v2`.`finance_fee_categories` 
				ON (`finance_fee_particulars`.`finance_fee_category_id` = `finance_fee_categories`.`id`)
		INNER JOIN `djemfcst_v2`.`batches` 
				ON (`students`.`batch_id` = `batches`.`id`)
		 INNER JOIN `djemfcst_v2`.`courses` 
				ON (`batches`.`course_id` = `courses`.`id`)     
				
 WHERE finance_transactions.payment_type=0 AND transaction_date = '" & DateFilter & "' 
	AND `finance_fee_categories`.`name`  = '" & nameParticular & "' 
	AND display_name = '" & nameOfPayee & "'
    and receipt_no = '" & receipt_no & "'
 
GROUP BY finance_fee_categories.id,display_name
 
ORDER BY display_name"
        Return DataObject(sql)
    End Function

    Friend Function GetPayeeList(DateFilter As String) As DataTable

        Dim str As String = ""
        If AuthUserType = "ADMIN" And LoginUserID <> "2105" Then
            str = " AND user_id = '" & LoginUserID & "'"
        Else
            str = " "
        End If



        Dim sql As String = ""
        sql = "


   
   SELECT
    '' AS 'NO.', 
	 id,
	 std_number,
	 transaction_date,
	 -- receipt_no,
     -- CAST(receipt_no AS INTEGER) 'receipt_no',
     IF(receipt_no + 0, receipt_no + 0, 9999999)'receipt_no',
	 payee,
	 COURSEYEAR
		FROM(									
					SELECT	
						id,
						std_number,
						transaction_date,
						receipt_no,
						CASE WHEN display_name IS NULL THEN `title` ELSE display_name END AS 'payee',
						CASE WHEN `COURSEYEAR` IS NULL THEN `address` ELSE `COURSEYEAR` END AS 'COURSEYEAR',
						amount,
						particulars,
						payment_type,
                        user_id
					FROM(SELECT
							finance_transactions.id,
							students.std_number,
							finance_transactions.transaction_date, 
							finance_transactions.receipt_no, 
							SUBSTRING(finance_transactions.title,17)'title', 
							finance_transactions.address,
							person.display_name,
							CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR', 
							SUM(finance_transactions.amount)'amount',
							(SELECT DISTINCT
							finance_transaction_categories.`name`
						FROM
							finance_transaction_categories
						WHERE
							finance_transaction_categories.id = finance_transactions.category_id) 'particulars',
							finance_transactions.payment_type,
                            finance_transactions.user_id
						FROM
							finance_transactions
							-- INNER JOIN finance_fee_categories ON finance_transactions.category_id = finance_fee_categories.id
							LEFT JOIN students ON finance_transactions.student_id = students.id
							LEFT JOIN person ON students.person_id = PERSON.person_id
							LEFT JOIN batches ON students.batch_id = batches.id
							LEFT JOIN courses ON students.course_id = courses.id
							
						WHERE
							payment_type = 1 AND transaction_date = '" & DateFilter & "' 
						GROUP BY finance_transactions.category_id,title
						ORDER BY finance_transactions.title
						)A
								
								
					UNION all
								
								
						SELECT
						id,
						std_number,
						transaction_date,
						receipt_no,
						payee,
						`COURSEYEAR`,
						amount,
						particulars,
						payment_type,
                        user_id
						FROM(SELECT 
									finance_transactions.id
									, students.std_number
									, finance_transactions.transaction_date
									, finance_transactions.receipt_no
									,  person.display_name 'payee'
									, CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR'   
									, SUM(`finance_transactions_onetime_payments`.`amount`)'amount'
									, `finance_fee_categories`.`name` 'particulars'
									, finance_transactions.payment_type
                                    , finance_transactions.user_id
							FROM
									`djemfcst_v2`.`students`
									INNER JOIN `djemfcst_v2`.`person` 
											ON (`students`.`person_id` = `person`.`person_id`)
									INNER JOIN `djemfcst_v2`.`finance_transactions` 
											ON (`finance_transactions`.`student_id` = `students`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_transactions_onetime_payments` 
											ON (`finance_transactions_onetime_payments`.`finance_transaction_id` = `finance_transactions`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_fee_particulars` 
											ON (`finance_transactions_onetime_payments`.`finance_fee_paticulars_id` = `finance_fee_particulars`.`id`)
									INNER JOIN `djemfcst_v2`.`finance_fee_categories` 
											ON (`finance_fee_particulars`.`finance_fee_category_id` = `finance_fee_categories`.`id`)
									INNER JOIN `djemfcst_v2`.`batches` 
											ON (`students`.`batch_id` = `batches`.`id`)
									 INNER JOIN `djemfcst_v2`.`courses` 
											ON (`batches`.`course_id` = `courses`.`id`)     
											
							 WHERE finance_transactions.payment_type=0 AND transaction_date = '" & DateFilter & "'
							 
							GROUP BY finance_fee_categories.id,display_name
							 
							ORDER BY display_name
							)B										
					)C		
					  -- WHERE transaction_date = '" & DateFilter & "' 
                         " & str & "
						 GROUP BY receipt_no,payee
					   ORDER BY receipt_no ASC
                       -- CAST(receipt_no AS INTEGER) ASC
                        ,payee,payment_type 

"
        Return DataSource(sql)
    End Function

    Friend Function getHearIncome(DateFilter As String) As DataTable


        Dim str As String = ""
        If AuthUserType = "ADMIN" And LoginUserID <> "2105" Then
            str = " WHERE user_id = '" & LoginUserID & "'"
        Else
            str = " "
        End If


        Dim sql As String = ""
        sql = "SELECT	
	particulars,
	payment_type
FROM(SELECT
		finance_transactions.id,
		finance_transactions.transaction_date, 
		finance_transactions.receipt_no, 
		SUBSTRING(finance_transactions.title,17)'title', 
		finance_transactions.address,
		person.display_name,
		CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR', 
		SUM(finance_transactions.amount)'amount',
		(SELECT DISTINCT
		finance_transaction_categories.`name`
	FROM
		finance_transaction_categories
	WHERE
		finance_transaction_categories.id = finance_transactions.category_id) 'particulars',
		finance_transactions.payment_type,
        finance_transactions.user_id
	FROM
		finance_transactions
		-- INNER JOIN finance_fee_categories ON finance_transactions.category_id = finance_fee_categories.id
		LEFT JOIN students ON finance_transactions.student_id = students.id
		LEFT JOIN person ON students.person_id = PERSON.person_id
		LEFT JOIN batches ON students.batch_id = batches.id
		LEFT JOIN courses ON students.course_id = courses.id
		
	WHERE
		payment_type = 1 AND transaction_date = '" & DateFilter & "' 
	GROUP BY finance_transactions.category_id,title
	ORDER BY finance_transactions.title
	)A " & str & "
      GROUP BY particulars    "
        Return DataSource(sql)
    End Function

    Friend Function getHeaderFees(DateFilter As String) As DataTable

        Dim str As String = ""
        If AuthUserType = "ADMIN" And LoginUserID <> "2105" Then
            str = " WHERE user_id = '" & LoginUserID & "'"
        Else
            str = " "
        End If


        Dim sql As String = ""
        sql = "SELECT
	particulars,
	payment_type	
	FROM(SELECT 
				finance_transactions.id
				, finance_transactions.transaction_date
				, finance_transactions.receipt_no
				,  person.display_name 'payee'
				, CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR'   
				, SUM(`finance_transactions_onetime_payments`.`amount`)'amount'
				, `finance_fee_categories`.`name` 'particulars'
				, finance_transactions.payment_type
                , finance_transactions.user_id
		FROM
				`djemfcst_v2`.`students`
				INNER JOIN `djemfcst_v2`.`person` 
						ON (`students`.`person_id` = `person`.`person_id`)
				INNER JOIN `djemfcst_v2`.`finance_transactions` 
						ON (`finance_transactions`.`student_id` = `students`.`id`)
				INNER JOIN `djemfcst_v2`.`finance_transactions_onetime_payments` 
						ON (`finance_transactions_onetime_payments`.`finance_transaction_id` = `finance_transactions`.`id`)
				INNER JOIN `djemfcst_v2`.`finance_fee_particulars` 
						ON (`finance_transactions_onetime_payments`.`finance_fee_paticulars_id` = `finance_fee_particulars`.`id`)
				INNER JOIN `djemfcst_v2`.`finance_fee_categories` 
						ON (`finance_fee_particulars`.`finance_fee_category_id` = `finance_fee_categories`.`id`)
				INNER JOIN `djemfcst_v2`.`batches` 
						ON (`students`.`batch_id` = `batches`.`id`)
				 INNER JOIN `djemfcst_v2`.`courses` 
						ON (`batches`.`course_id` = `courses`.`id`)     
						
		 WHERE finance_transactions.payment_type=0 AND transaction_date = '" & DateFilter & "'
		 
		GROUP BY finance_fee_categories.id,display_name
		 
		ORDER BY display_name
		)B	" & str & "	
		 GROUP BY particulars
		 "
        Return DataSource(sql)
    End Function

    Friend Function getHeaderFeesIncome(DateFilter As Date) As DataTable
        Dim sql As String = ""
        sql = "     SELECT
       particulars,
			 payment_type
      FROM(
							SELECT
								 particulars,
								 payment_type

									FROM(									
												SELECT	
													id,
													transaction_date,
													receipt_no,
													CASE WHEN display_name IS NULL THEN `title` ELSE display_name END AS 'payee',
													CASE WHEN `COURSEYEAR` IS NULL THEN `address` ELSE `COURSEYEAR` END AS 'COURSEYEAR',
													amount,
													particulars,
													payment_type
												FROM(SELECT
														finance_transactions.id,
														finance_transactions.transaction_date, 
														finance_transactions.receipt_no, 
														SUBSTRING(finance_transactions.title,17)'title', 
														finance_transactions.address,
														person.display_name,
														CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR', 
														SUM(finance_transactions.amount)'amount',
														(SELECT DISTINCT
														finance_transaction_categories.`name`
													FROM
														finance_transaction_categories
													WHERE
														finance_transaction_categories.id = finance_transactions.category_id) 'particulars',
														finance_transactions.payment_type
													FROM
														finance_transactions
														-- INNER JOIN finance_fee_categories ON finance_transactions.category_id = finance_fee_categories.id
														LEFT JOIN students ON finance_transactions.student_id = students.id
														LEFT JOIN person ON students.person_id = PERSON.person_id
														LEFT JOIN batches ON students.batch_id = batches.id
														LEFT JOIN courses ON students.course_id = courses.id
														
													WHERE
														payment_type = 1 -- AND transaction_date = '2023-05-22' 
													GROUP BY finance_transactions.category_id,title
													ORDER BY finance_transactions.title
													)A
															
															
												UNION all
															
															
													SELECT
													id,
													transaction_date,
													receipt_no,
													payee,
													`COURSEYEAR`,
													amount,
													particulars,
													payment_type	
													FROM(SELECT 
																finance_transactions.id
																, finance_transactions.transaction_date
																, finance_transactions.receipt_no
																,  person.display_name 'payee'
																, CONCAT(`courses`.`course_name`,'-', `batches`.`year_level`) 'COURSEYEAR'   
																, SUM(`finance_transactions_onetime_payments`.`amount`)'amount'
																, `finance_fee_categories`.`name` 'particulars'
																, finance_transactions.payment_type
														FROM
																`djemfcst_v2`.`students`
																INNER JOIN `djemfcst_v2`.`person` 
																		ON (`students`.`person_id` = `person`.`person_id`)
																INNER JOIN `djemfcst_v2`.`finance_transactions` 
																		ON (`finance_transactions`.`student_id` = `students`.`id`)
																INNER JOIN `djemfcst_v2`.`finance_transactions_onetime_payments` 
																		ON (`finance_transactions_onetime_payments`.`finance_transaction_id` = `finance_transactions`.`id`)
																INNER JOIN `djemfcst_v2`.`finance_fee_particulars` 
																		ON (`finance_transactions_onetime_payments`.`finance_fee_paticulars_id` = `finance_fee_particulars`.`id`)
																INNER JOIN `djemfcst_v2`.`finance_fee_categories` 
																		ON (`finance_fee_particulars`.`finance_fee_category_id` = `finance_fee_categories`.`id`)
																INNER JOIN `djemfcst_v2`.`batches` 
																		ON (`students`.`batch_id` = `batches`.`id`)
																 INNER JOIN `djemfcst_v2`.`courses` 
																		ON (`batches`.`course_id` = `courses`.`id`)     
																		
														 WHERE finance_transactions.payment_type=0 -- AND transaction_date = '2022-07-19'
														 
														GROUP BY finance_fee_categories.id,display_name
														 
														ORDER BY display_name
														)B								
																
												)C		WHERE transaction_date = '" & Format(DateFilter.Date, "yyyy-MM-dd") & "'
					
					
					    UNION ALL
							
							SELECT 'CashOnHande' AS 'particulars',
							        2 AS 'payment_type' 
					
					
					)D
						 GROUP BY particulars
					   ORDER BY payment_type
					
					
					  "
        Return DataSource(sql)
    End Function

    Friend Function getHeaderPayee() As DataTable
        Dim sql As String = ""
        sql = "SELECT 'ID' AS 'id','ID NO.#' AS 'std_number', 'DATE' AS 'transaction_date','OR NO.#' AS 'receipt_no', 'PAYEE' AS 'payee','COURSE' as 'COURSEYEAR'"
        Return DataSource(sql)

    End Function
End Class
