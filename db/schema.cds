namespace com.logaligroup;


entity Products {
    key ID          : UUID;
        product     : String(10);
        productName : String(40);
        description : LargeString;
        category    : String;
        subCategory : String;
        status      : String;
        price       : Decimal(6, 2);
        rating      : Decimal(3, 2);
        currency    : String;
        detail      : Association to ProductDetails;
};

type myDecimal : Decimal(8, 3);

entity ProductDetails {
    key ID         : UUID;
        baseUnit   : String default 'EA';
        width      : myDecimal;
        height     : myDecimal;
        depth      : myDecimal;
        wight      : myDecimal;
        unitVolume : String default 'CM';
        unitWeight : String default 'KG';

}

entity Categories {
    key ID          : UUID;
        category    : String(40);
        description : LargeString;
        toSubCategories : Association to many SubCategories on toSubCategories.category = $self;

}

entity SubCategories {
    key ID          : UUID;
        subCategory : String(40);
        description : LargeString;
        category  : Association to Categories;
}
