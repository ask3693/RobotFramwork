from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

        def __init__(self):
            self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")           #self refers to the current class object
                                                                                    #we need to store lib into a variable selLib
        @keyword
        def hello_world(self):
            print("Hello World!!")          # The function name automatically becomes the keyword when keyword
                                            # annotation is given above it

        @keyword
        def add_items_to_cart_and_checkout(self, productslist):
            productsTitles = self.selLib.get_webelements("css:.card-title")
            i=1
            for productsTitle in productsTitles:
                if productsTitle.text in productslist:
                    self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

                i=i+1
            self.selLib.click_link("css:li.active a")