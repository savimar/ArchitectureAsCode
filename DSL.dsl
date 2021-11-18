workspace "Транснациональная компания по производству и продаже спортирных товаров и инвентаря" {
!identifiers hierarchical


    model {
    
    #Users
        client = person "Клиент" "Клиенты, пользователи" "Синий"
        distributor = person "Дистибьютор"
        
        
    #System
    enterprise "Big Sport plc" {
        logistics = softwareSystem  "Логистика" "Обеспечивает доставку клиентам и дистибьютерам, Внешнее ПО" "Красный" {
            logistic = container "Логистика" 
            api = container "API"
        }
        clientApps = softwareSystem "Клиентские приложения" "Приложения для клиентов и дистибьюторов" "Голубой"{
          
            mobile = container "Мобильное приложение" "Мобильные приложения" "Android, IOS" "Мобил"
            api = container "API"
            catalog = container "Сайт-каталог продукции для покупателей"
            clients = container " ЛК для клиента" 
            distributors = container "ЛК для дистибьютора" 
            orders = container "Заказы" 
            
            #Relationships
            client -> api "Пользователь заходит в свой ЛК для заказа товара"
            distributor -> api  "Дистибьютер заходит в свой ЛК для заказа товара"
            api -> mobile
            api -> catalog
            catalog ->  clients
            catalog ->  distributors
            clients -> orders
            distributors -> orders
            mobile -> orders
            
            
        }
        
        production = softwareSystem "Производство" "Управление производтсвенным циклом" "Зеленый" {
            manufacturingControl = container "Управление производством" 
            suppliers = container "Поставщики" 
            materials = container "Склады материалов" 
            qualityControl = container "Контроль качества" 
            iot = container "IoT" 
            
            #Relationships
            suppliers -> materials
            materials -> manufacturingControl
            iot -> manufacturingControl
            manufacturingControl -> iot
            manufacturingControl -> qualityControl
            qualityControl -> manufacturingControl
            
        }
        
        warehouses = softwareSystem "Склад" "Готовая продукция"  "Серый"{
            warehouse = container "Склад готовой продукции" 
            api = container "API"
            iot = container "IoT" 
            
            #Relationships
            logistics -> api "Резервирование и сборка заказа"
            production -> api  "Наполнение складов готовой продукцией"
            api -> warehouse 
            iot -> warehouse
            warehouse ->  iot
            
        }
        
        
       }
       
        
        


    #Relationships
        clientApps -> logistics "Заказ приходит в службу доставки"
        
    }
    
    #views

    views {
        systemlandscape "SystemLandScape" "Системный ландшафт" {
           title "Системный ландшафт. Транснациональная компания по производству и продаже спортирных товаров и инвентаря"
            include *
        }
    
        container clientApps systemContextClientApps  {
            include *
           autolayout
        }
      
        systemContext logistics  systemContextLogistics {
            include *
            autolayout
        }
         container warehouses  systemContextWarehouses {
            include *
            autolayout
        }
         container production  systemContextProduction {
            include *
            autolayout
        }
        theme default
        
        
        #styles
        
    styles {
       element "Мобил" {
           shape MobileDevicePortrait
           background #008b45
           color #ffffff
       }
      
       element "Голубой" {
           background #4682B4
           color #ffffff
       }
       element "Красный" {
           background #bd1112
           color #ffffff
       }
        
        element "Зеленый" {
           background #228B22
           color #ffffff
       }
        element "Серый" {
           background #708090
           color #ffffff
       }
        element "Синий" {
           background #0000CD
           color #ffffff
       }
       relationship Relationship {
                dashed false
            }
      }
     }
    
}
