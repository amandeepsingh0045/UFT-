'Close add Popups
Sub Close_Popup()
	Set popup = Description.Create()
	popup("Class Name").Value = "WebElement"
	popup("class").Value = "wewidgeticon we_close"
	popup("html tag").Value = "I"
	Wait(5)
	If Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement(popup).Exist(10) Then
		Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement(popup).Click
	End If
	Wait(2)
End Sub
'#########################################################################################################################################
' To Capture Screenshot of Benches Page
Sub Capture_Screenshots(GetFolderPath)
	'Declaring Variables
	Dim d,d1,d2,d3,d4,Screenshot_FilePath
	
	d=Now
	d1=replace(d,"/","")
	d2=replace(d1,":","")
	d3=replace(d2,"AM","")
	d4=replace(d3,"PM","")
	
	Screenshot_FilePath= GetFolderPath &"\Screenshots\capture" &d4 &".png"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").CaptureBitmap Screenshot_FilePath,True
End Sub
'#########################################################################################################################################	

'Launch Application
Sub Launch_Home_Application()
	'Declaring Variables
	Dim strURL
	 'Close the existing browsers
'	While Browser("creationtime:=0").Exist(0)
'   		  Browser("creationtime:=0").Close
'   	 Wend
   	 Wait(5)
   	 strURL = DataTable.Value("URL","Global")
   	 Systemutil.Run "iexplore.exe",strURL
    	wait(5)
    	Reporter.ReportEvent micPass,"Validate Home Page","Home Page displayed successfully"
End Sub
'#########################################################################################################################################
'Navigate to Car loan  calc using Menu
Sub Navigate_to_EMI_calc_using_Menu()
	Browser("Browser_EMI_Calc").Page("Compare and Apply for").WebElement("Menu").Click
	Wait(2)
	Browser("Browser_EMI_Calc").Page("Compare and Apply for").WebElement("Calculators").Click
	Wait(2)
	Browser("Browser_EMI_Calc").Page("Compare and Apply for").Link("EMI Calculator").Click
	Wait(5)
	'Close th Popup notifications
	Call Close_Popup()
	Wait(2)
	Reporter.ReportEvent micPass,"To Navigate to Car loan  calc using Menu","User successsfully navigated to Car loan  calc using Menu"
End Sub
'#########################################################################################################################################
'Navigate to Car Loan EMI Calculator
Sub Navigate_to_Car_Loan_EMI_Calculator()
	'To launch Application in Browser
	Call Launch_Home_Application()
	'Navigate to Car loan  calc using Menu
	Call Navigate_to_EMI_calc_using_Menu()
	Browser("Browser_EMI_Calc").Page("EMI Calculator - Calculate").WebElement("Carn Loan Calc").Click
	'Close th Popup notifications
	Wait(5)
	Call Close_Popup()
	Wait(2)
	Reporter.ReportEvent micPass,"Navigate to Car Loan EMI Calculator","User successfully navigated to Car Loan EMI Calculator"
End  Sub
'#########################################################################################################################################
'Enter Car Loan Amount
Sub Enter_Loan_Amount_For_Car_Loan()
	'Declaring Variables
	Dim cl_amount
	Set amt = Description.Create()
	amt("Class Name").Value = "WebEdit"
	amt("class").Value = "emi-loan-max-amt el-input number dontvalidate"
	amt("html id").Value = "loanAmountSlider"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit(amt).Click
	cl_amount = DataTable.Value("Car_Loan_Amount","Global")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("Loan_Amount").Set cl_amount
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebButton("Ok_amount").Click
	Wait(2)
	Reporter.ReportEvent micPass,"Enter Car Loan Amount","Car Loan Amount Entered Successfully"
End Sub
'#########################################################################################################################################
'Enter Car Loan Tenure
Sub Enter_Loan_Tenure_For_Car_Loan()
	'Declaring Variables
	Dim cl_tenure
	
	Set my_yr = Description.Create
	my_yr("Class Name").Value = "Link"
	my_yr("class").Value = "loan-tenure-year-popup"
	my_yr("html tag").Value = "A"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").Link(my_yr).Click
	cl_tenure = DataTable.Value("Car_Loan_Tenure","Global")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("enter_year").Set cl_tenure
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebButton("Ok_year").Click
	Wait(2)
	Reporter.ReportEvent micPass,"Enter Car Loan Tenure","Car Loan Tenure Entered Successfully"
End Sub
'#########################################################################################################################################
'Enter Car Loan ROI
Sub Enter_Loan_Interest_For_Car_Loan()
	'Declaring Variables
	Dim cl_interest
	cl_interest = DataTable.Value("Car_Loan_ROI","Global")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("interestRate").Set cl_interest
	Reporter.ReportEvent micPass,"Enter Car Loan Interest","Car Loan Interest Entered Successfully"
End Sub
'#########################################################################################################################################
'Calculate Car Loan Emi
Sub Click_Calculate_Car_Loan(GetFolderPath)
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebButton("Calculate").Click
	Reporter.ReportEvent micPass,"Click Calculate Button","Calculate Button is successfully Clicked"
	Wait(5)
	' To Capture Screenshot of Benches Page
	Call Capture_Screenshots(GetFolderPath)
End Sub
'#########################################################################################################################################
'Printing Car Loan EMI For One Month
Sub Printing_Car_Loan_EMI_For_One_Month()
	'Declaring Variables
	Dim Emi_for_one_month
	Emi_for_one_month = Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("emiVal").GetROProperty("innertext")
       Print ("Car Loan EMI For One Month : " &Emi_for_one_month)
       Reporter.ReportEvent micPass,"To Print Car Loan EMI For One Month","Car Loan EMI For One Month is Successfully Printed"
End Sub
'#########################################################################################################################################
'Printing First Month Principal and Interest For Car Loan
Sub Printing_First_Month_Principal_and_Interest_For_Car_Loan()
	'Declaring Variables
	Dim first_month_principal,first_month_interest
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("year_1_table_element").Click
	first_month_principal =Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebTable("Year").GetCellData(3,2)
	first_month_interest =Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebTable("Year").GetCellData(3,3)
	Print("First_Month_Principal_Car_Loan : " &first_month_principal)
	Print("First_Month_Interest_For_Car_Loan : " &first_month_interest)
	Reporter.ReportEvent micPass,"To Print First Month Principal and Interest For Car Loan","First Month Principal and Interest For Car Loan is Successfully Printed"
End Sub
'#########################################################################################################################################
'#########################################################################################################################################
'Navigate to Home Loan EMI Calculator
Sub Navigate_to_Home_Loan_EMI_Calculator()
	Browser("Browser_EMI_Calc").Page("EMI Calculator - Calculate").WebElement("home loan EMI Calculator").Click
	'Close th Popup notifications
	Call Close_Popup()
	Wait(2)
	Reporter.ReportEvent micPass,"Navigate to Home Loan EMI Calculator","User Successfully navigated to Home Loan EMI Calculator"
End  Sub
'#########################################################################################################################################
'Enter Home Loan Amount
Sub Enter_Loan_Amount_For_Home_Loan()
	'Declaring Variables
	Dim hl_amount
	
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebEdit("loanAmountSlider").Click
	Wait(3)
	hl_amount = DataTable.Value("Home_Loan_Amount","Global")
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebEdit("home_loan_amount").Set hl_amount
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebButton("Ok_home_loan_amount").Click
	Wait(5)
	Reporter.ReportEvent micPass,"Enter Home Loan Amount","Home Loan Amount entered successfully"
End Sub
'#########################################################################################################################################
'Enter Home Loan Tenure
Sub Enter_Loan_Tenure_For_Home_Loan()
	'Declaring Variables
	Dim hl_tenure
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").Link("Years").Click
	hl_tenure = DataTable.Value("Home_Loan_Tenure","Global")
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebEdit("home_loan_tenure").Set hl_tenure
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebButton("Ok_yr").Click
	Wait(2)
	Reporter.ReportEvent micPass,"Enter Home Loan Tenure","Home Loan Tenure entered successfully"
End Sub
'#########################################################################################################################################
'Enter Home Loan ROI
Sub Enter_Loan_Interest_For_Home_Loan_and_Calculate()
	'Declaring Variables
	Dim hl_interest
	hl_interest = DataTable.Value("Home_Loan_ROI","Global")
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebEdit("interestRate").Set hl_interest
	Reporter.ReportEvent micPass,"Enter Home Loan ROI","Home Loan ROI entered successfully"
End Sub
'#########################################################################################################################################
'Calculate Home Loan Emi
Sub Click_Calculate_Home_Loan(GetFolderPath)
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebButton("Calculate").Click
	Reporter.ReportEvent micPass,"Click Calculate Button","Calculate Button is successfully Clicked"
	Wait(5)
	' To Capture Screenshot of Benches Page
	Call Capture_Screenshots(GetFolderPath)
End Sub
'#########################################################################################################################################
'Printing Home Loan EMI For One Month
Sub Printing_Home_Loan_EMI_For_One_Month()
	'Declaring Variables
	Dim home_loan_emi
	home_loan_emi = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebElement("emiVal").GetROProperty("innertext")
	Print("Home Loan EMI For One Month : " &home_loan_emi)
	Reporter.ReportEvent micPass,"To Print Home Loan EMI For One Month","Home Loan EMI For One Month is Successfully Printed"
End Sub
'#########################################################################################################################################
'Getting all the data from  year on year table
Sub Getting_all_the_data_from_year_on_year_table()
	'Declaring Variables
	Dim iRowCnt,i,sData1,sData2,sData3,sData5
	Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebElement("WebElement").Click
	iRowCnt=Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").RowCount
	For i = 1 to iRowCnt
        	 sData1 = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").GetCellData(i,1)
    	 	 sData2 = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").GetCellData(i,2)
    		 sData3 = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").GetCellData(i,3)
    		 sData4 = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").GetCellData(i,4)
   		 sData5 = Browser("Browser_EMI_Calc").Page("Home Loan EMI Calculator").WebTable("Year").GetCellData(i,5)
  	 	 DataTable("Year","Hackathon_Team_4") = sData1
   		 DataTable("Principal","Hackathon_Team_4") = sData2
  	 	 DataTable("Interest","Hackathon_Team_4") = sData3
   	 	DataTable("Total","Hackathon_Team_4") = sData4
  	 	DataTable("OutStanding","Hackathon_Team_4") = sData5
   	 	DataTable.SetCurrentRow(i)
Next
End Sub

'#########################################################################################################################################
'#########################################################################################################################################
'Validate Loan Amount Text Box
Sub Validate_Loan_Amount_Text_Box()
	'Declaring Variables
	Dim my_carloan_amount,carloan_amount1,carloan_amount2,carloan_amount_in_page
	Dim my_slider_value1,my_slider_value2,my_slider_value
	'Validating Car Loan Amount Text Box
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("loanAmountSlider").Output CheckPoint("loanAmountSlider_check")
	my_carloan_amount = DataTable.Value("Car_Loan_Amount","Global")
	carloan_amount1=Trim(DataTable.Value("loanAmountSlider_value_out","Global"))
	carloan_amount2 = Split(carloan_amount1,",")
	For Each x in carloan_amount2
		carloan_amount_in_page = carloan_amount_in_page &x
	Next
	
	
	If my_carloan_amount = carloan_amount_in_page  Then
		Reporter.ReportEvent micPass,"Validate Car Loan Amount Text Box","Entered Value is successfully updated"
	Else
		Reporter.ReportEvent micFail,"Validate Car Loan Amount Text Box","Entered Value is NOT updated"
	End If
	'Validate Loan Amount Slider
	my_slider_value1 = Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("Car_Loan_Slider").GetROProperty("innertext")
	my_slider_value2 = Split(my_slider_value1,",")
	For Each x in my_slider_value2
		my_slider_value = my_slider_value &x
	Next
	
	If my_carloan_amount = my_slider_value  Then
		Reporter.ReportEvent micPass,"Validate Car Loan Amount Slider Value","Entered Value is successfully updated"
	Else
		Reporter.ReportEvent micFail,"Validate Car Loan Amount Slider Value","Entered Value is NOT updated"
	End If
End Sub
'#########################################################################################################################################
'Validate Loan Amount Text Box With Invalid Data
Sub Enter_Invalid_Loan_Amt()
	Set amt = Description.Create()
	amt("Class Name").Value = "WebEdit"
	amt("class").Value = "emi-loan-max-amt el-input number dontvalidate"
	amt("html id").Value = "loanAmountSlider"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit(amt).Click
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("Loan_Amount").Set "abc1500000"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebButton("Ok_amount").Click
	Wait(2)
	
End Sub

'#########################################################################################################################################
'Validating  Loan Tenure Text Box
Sub Validate_Loan_Tenure_Text_Box()
	'Declaring Variables
	Dim my_carloan_tenure,carloan_tenure1,carloan_tenure2,carloan_tenure_in_page
	Dim tenure_slider1,tenure_slider2,tenure_slider
	'Validating Car Loan Tenure Text Box
	my_carloan_tenure = DataTable.Value("Car_Loan_Tenure","Global")
	
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("0").Output CheckPoint("tenure_check")
	carloan_tenure1 =Trim(DataTable.Value("tenureFee_innertext_out","Global"))
	carloan_tenure2 = Split(carloan_tenure1," ")
	carloan_tenure_in_page = carloan_tenure2(0)
	
	If my_carloan_tenure = carloan_tenure_in_page  Then
		Reporter.ReportEvent micPass,"Validate Car Loan Tenure Text Box","Entered Value is successfully updated"
	Else
		Reporter.ReportEvent micFail,"Validate Car Loan Tenure Text Box","Entered Value is NOT updated"
	End If
	'Validate Loan Tenure Slider
	tenure_slider1 = Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("Car_Tenure_Slider").GetROProperty("innertext")
	tenure_slider2 = len(tenure_slider1)-2
	tenure_slider = mid(tenure_slider1,1,tenure_slider2)
	
	If my_carloan_tenure = tenure_slider  Then
		Reporter.ReportEvent micPass,"Validate Car Loan Tenure Slider Value","Entered Value is successfully updated"
	Else
		Reporter.ReportEvent micFail,"Validate Car Loan Tenure Slider Value","Entered Value is NOT updated"
	End If
End Sub
'#########################################################################################################################################
'Validate Loan Tenure Text Box With Invalid Data
Sub Enter_Invalid_Loan_Tenure()
	Wait(3)
	Set my_yr = Description.Create
	my_yr("Class Name").Value = "Link"
	my_yr("class").Value = "loan-tenure-year-popup"
	my_yr("html tag").Value = "A"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").Link(my_yr).Click
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("enter_year").Set "-1"
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebButton("Ok_year").Click
	Wait(2)
	
End Sub
'#########################################################################################################################################
'Validating Car Loan Interest Text Box
Sub Validate_Loan_Interest_Text_Box()
	'Declaring Variables
	Dim my_carloan_interest,carloan_interest1,carloan_interest2,carloan_interest_in_page
	'Validating Car Loan Interest Text Box
	my_carloan_interest = DataTable.Value("Car_Loan_ROI","Global")
	Wait(2)
	
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("interestRate").Output CheckPoint("interestRate")
	carloan_interest1 =Trim(DataTable.Value("interestRate_innertext_out","Global"))
	carloan_interest2 = len(carloan_interest1)-1
	carloan_interest_in_page = mid(carloan_interest1,1,carloan_interest2)
	
	If my_carloan_interest = carloan_interest_in_page  Then
		Reporter.ReportEvent micPass,"Validate Car Loan Interest Text Box","Entered Value is successfully updated"
	Else
		Reporter.ReportEvent micFail,"Validate Car Loan Interest Text Box","Entered Value is NOT updated"
	End If
End Sub
'#########################################################################################################################################
'Validate Loan Interest Test Box Display Error Message With Data Having Value >50 or 0
Function Check_ROI_Value(val)
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("interestRate").Set val
	Wait(5)
	If Browser("Car Loan EMI Calculator").Page("Car Loan EMI Calculator").WebElement("Please select range between").Exist(10) then
		Print "Entered Value is >50 or  0 so Error Message is displayed"
		Reporter.ReportEvent micPass,"Validate oan Interest Test Box Display Error Message With Data Having Value >50 or 0","Error Message Displayed"
	Else
		Print "Entered Value is >50 or  0 But Error Message is not displayed"
		Reporter.ReportEvent micFail,"Validate oan Interest Test Box Display Error Message With Data Having Value >50 or 0","Error Message Not Displayed"
	End If
End Function
Sub Validate_Loan_Interest_Text_Box_With_Boundary_Values()
	'Declaring Variables
	Dim a,b
	a=51
	b=0
	Call Check_ROI_Value(a)
	Call Check_ROI_Value(b)
		
End Sub
'#########################################################################################################################################
'Validate Loan Interest Test Box With InValid Data()
Sub Enter_Invalid_Loan_Interest()
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebEdit("interestRate").Set "-9.5"
	Wait(2)
End Sub
'#########################################################################################################################################

'check EMI per month
Sub Validate_EMI_Per_Month()
	'Declaring Variables
	Dim my_carloan_amount,my_carloan_interest,my_carloan_tenure,p,r,t,emi,ans_emi
	Dim Emi1,Emi2,Emi3,Emi4,Obtained_Emi,my_Obtained_Emi
	'check EMI per month
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("emiVal").Output CheckPoint("emiVal")
	'Manually Calculating EMI
	my_carloan_amount = DataTable.Value("Car_Loan_Amount","Global")
	my_carloan_interest = DataTable.Value("Car_Loan_ROI","Global")
	my_carloan_tenure = DataTable.Value("Car_Loan_Tenure","Global")
	p=my_carloan_amount
	r=(my_carloan_interest/12)/100
	t=my_carloan_tenure*12

	emi=(p*r*((1+r)^t))/(((1+r)^t)-1)
	emi=FormatNumber(emi,0)
	emi=Cstr(emi)
	ans_emi="Rupees"&emi
	Print "Manually Calculated Car Loan EMI : " &ans_emi
	Manual_EMI_Calc = ans_emi
	'Using EMI Obtained From WebPage
	Emi1 = Trim(DataTable.Value("emiVal_innertext_out","Global"))
	Emi2 = Split(Emi1,",")
	For Each x in Emi2
		Emi3 = Emi3 &x
	Next
	Emi4=FormatNumber(Emi3,0)
	Emi5=Cstr(Emi4)
	Obtained_Emi = "Rupees"&Emi5
	my_Obtained_Emi = Manual_EMI_Calc
	
	If Obtained_Emi = my_Obtained_Emi  Then
		Reporter.ReportEvent micPass,"Validate EMI Calculation","Obtained Value is Accurate"
	Else
		Reporter.ReportEvent micDone,"Validate EMI Calculation","Obtained Value is NOT Accurate"
	End If
End Sub
'#########################################################################################################################################	
'Printing Page displayed or calculated Values
Sub Print_Page_Provided_Results()
	'Declaring Variables
	Dim my_amount,my_interest,my_tenure,Total_Interest_Due,Total_Amount_Payable
	'Printing Page displayed or calculated Values
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("loanAmountDetails").Output CheckPoint("Entered_loan_Amount")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("tenureFee").Output CheckPoint("Entered_tenure")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("interestRate").Output CheckPoint("Entered_ROI")
	
	my_amount = DataTable.Value("loanAmountDetails_innertext_out","Global")
	my_interest = DataTable.Value("interestRate_innertext_out","Global")
	my_tenure =DataTable.Value("tenureFee_innertext_out","Global")
	

	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("pieInterestPay").Output CheckPoint("Total_Interest_Due")
	Browser("Browser_EMI_Calc").Page("Car Loan EMI Calculator").WebElement("pieTotalAmount").Output CheckPoint("Total_Amount_Payable")
	
	Total_Interest_Due = DataTable.Value("pieInterestPay_innertext_out","Global")
	Total_Amount_Payable =  DataTable.Value("pieTotalAmount_innertext_out","Global")
	
	Print ("Displayed Loan Amount : " &my_amount)
	Print ("Displayed Loan ROI : " &my_interest)
	Print ("Displayed Loan Tenure : " &my_tenure)
	Print ("Displayed Total_Interest_Due : " &Total_Interest_Due)
	Print ("Displayed Total_Amount_Payable : " &Total_Amount_Payable)
	
	Reporter.ReportEvent micPass,"Validate UI Elements","UI Elements are Sucessfully Validated"
End Sub
	
'#########################################################################################################################################	
'#########################################################################################################################################
'Closing the Browser
Sub Close_Browser()
	SystemUtil.CloseProcessByName("iexplore.exe")
	Reporter.ReportEvent micPass,"To Close Browser","Browser Sucessfully Closed"
End Sub
'#########################################################################################################################################
'#########################################################################################################################################




