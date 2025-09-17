namespace com.logali;

using {cuid} from '@sap/cds/common';

entity Products : cuid {
    Name             : String;
    Description      : String;
    ImageUrl         : String;
    ReleaseDate      : DateTime;
    DiscontinuedDate : DateTime;
    Price            : Decimal(16, 2);
    Height           : Decimal(16, 2);
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
}
