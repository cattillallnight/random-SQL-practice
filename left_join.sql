SELECT 
    CarCategories.CategoryID, 
    CarCategories.CategoryName, 
    case
    when  count(Rentals.RentalID) =0 
    then 0
    else count(Rentals.RentalID) 
    end as NumberOfRentals
FROM   CarCategories 
left JOIN Cars ON CarCategories.CategoryID = Cars.CategoryID 
left JOIN Rentals ON Cars.CarID = Rentals.CarID
and Rentals.RentalDate >= '2019-01-01' and Rentals.RentalDate <= '2019-03-31'
group by CarCategories.CategoryID, CarCategories.CategoryName
order by NumberOfRentals desc, CarCategories.CategoryName asc