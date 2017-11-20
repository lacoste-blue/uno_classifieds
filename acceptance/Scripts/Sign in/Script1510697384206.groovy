import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory as CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as MobileBuiltInKeywords
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testcase.TestCaseFactory as TestCaseFactory
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testdata.TestDataFactory as TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository as ObjectRepository
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WSBuiltInKeywords
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUiBuiltInKeywords
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl('http://localhost:3000/users/sign_in')

WebUI.setText(findTestObject('Page_UnoClassifieds/input_useremail'), 'testuser91@uno.edu')

WebUI.setText(findTestObject('Page_UnoClassifieds/input_userpassword'), '123456')

WebUI.click(findTestObject('Page_UnoClassifieds/input_commit'))

WebUI.click(findTestObject('Page_UnoClassifieds/span_glyphicon glyphicon glyph'))

WebUI.click(findTestObject('Page_UnoClassifieds/a_Create New'))

WebUI.setText(findTestObject('Page_UnoClassifieds/input_listingtitle'), 'bmw')

WebUI.selectOptionByValue(findTestObject('Page_UnoClassifieds/select_listingcategory_id'), '2', true)

WebUI.setText(findTestObject('Page_UnoClassifieds/input_listingall_tags'), 'cars')

WebUI.setText(findTestObject('Page_UnoClassifieds/input_listinglocation'), 'louisiana')

WebUI.setText(findTestObject('Page_UnoClassifieds/textarea_listingdescription'), 'for sale by owner')

WebUI.setText(findTestObject('Page_UnoClassifieds/input_listingprice'), '12500.00')

WebUI.click(findTestObject('Page_UnoClassifieds/input_commit_1'))

WebUI.click(findTestObject('Page_UnoClassifieds/span_glyphicon glyphicon glyph_1'))

WebUI.clickOffset(findTestObject('Page_UnoClassifieds/a_Create New'), 0, 0)

WebUI.closeBrowser()

