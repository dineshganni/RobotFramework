from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
      def __init__(self):
          self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")


      @keyword
      def helloworld(self):
          print("hello world")

      @keyword
      def add_items_to_cart(self, productlist):
          product_titles = self.selLib.get_webelements("css:.card-title")
          product_buttons = self.selLib.get_webelements(
                   "xpath=//button[contains(@class,'btn-info')]"
               )

          for i, product in enumerate(product_titles):
              if product.text.strip() in productlist:
                 product_buttons[i].click()

          checkout = "xpath=//a[contains(@class,'btn-primary') and contains(.,'Checkout')]"

          self.selLib.wait_until_element_is_visible(checkout, timeout="10s")
          self.selLib.wait_until_element_is_enabled(checkout, timeout="10s")
          self.selLib.click_element(checkout)
