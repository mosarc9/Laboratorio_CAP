namespace com.logali;

using {cuid} from '@sap/cds/common';

define type Name        : String(50);

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

type EmailsAddresses_01 : array of {
    kind  : String;
    email : String;
}

type EmailsAddresses_02 {
    kind  : String;
    email : String;
};

type Emails {
    email_01 : EmailsAddresses_01;
    email_02 : many EmailsAddresses_02;
    email_03 : many {
        kind  : String;
        email : String;
    };
};

type Gender             : String enum {
    male;
    female;
};

entity Order {
    clientGender : Gender;
    status       : Integer enum {
        submitted = 1;
        fulfiller = 2;
        shipped = 3;
        cancel = -1;
    };
    Priority     : String @assert.range enum {
        high;
        medium;
        low;
    }
};

entity Car : cuid {
            name       : String;
    virtual discount_1 : Decimal;
    virtual discount_2 : Decimal;
}

entity Products : cuid {
    Name             : String not null;
    Description      : String;
    ImageUrl         : String;
    ReleaseDate      : DateTime default $now;
    DiscontinuedDate : DateTime;
    Price            : Decimal(16, 2);
    Height           : type of Price;
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
};

entity Suppliers : cuid {
    Name    : Products:Name; //String;
    Address : Address;
    Email   : String;
    Phone   : String;
    Fax     : String;
};

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData : cuid {
    DeliveryDate : DateTime;
    Revenue      : Decimal(16, 2);
};

//Entidades Select

entity SelProducts                 as select from Products;

entity SelProducts1                as
    select from Products {
        *
    };

entity SelProducts2                as
    select from Products {
        Name,
        Price,
        Quantity,
    };

entity SelProducts3                as
    select from Products
    left join ProductReview
        on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(Price) as TotalPrice
    }
    group by
        Rating,
        Products.Name
    order by
        Rating;

//Entity as Projections

entity ProjProducts                as projection on Products;

entity ProjProducts2               as
    projection on Products {
        *
    };

entity ProjProducts3               as
    projection on Products {
        ReleaseDate,
        Name
    };

// Entity with parameters

entity ParamPrducts(pName: String) as
    select from Products {
        Name,
        Price,
        Quantity
    }
    where
        Name = :pName;
