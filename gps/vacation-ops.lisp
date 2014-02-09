;In order to take a vacation you must have money, luggage, and tickets.
;If do not have luggage, you can buy some with money.
;If you do not have tickets, you can buy them with money.    

(defparameter *vacation-ops*
          (list
              (make-op :action 'go-on-vacation
                       :preconds '(have_money have-luggage)
                       :add-list '(zach-on-vacation)
                       :del-list '(zach-at-home))
              (make-op :action 'shop-installs-battery
                       :preconds '(car-needs-battery shop-knows-problem 
shop-has-money)
                       :add-list '(car-works))
              (make-op :action 'tell-shop-problem
                       :preconds '(in-communication-with-shop)
                       :add-list '(shop-knows-problem))
              (make-op :action 'telephone-shop
                       :preconds '(know-phone-number)
                       :add-list '(in-communication-with-shop))
              (make-op :action '(look-up-number)
                       :preconds '(have-phone-book)
                       :add-list '(know-phone-number))
              (make-op :action 'give-shop-money
                       :preconds '(have-money)
                       :add-list '(shop-has-money)
                       :del-list '(have-money))))

