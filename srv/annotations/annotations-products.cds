using {Products as myservice} from '../service';
using from './annotations-suppliers';

annotate myservice.Products with {
    product     @title: 'Product';
    productName @title: 'Product Name';
    supplier    @title: 'Supplier';
    category    @title: 'Category';
    subCategory @title: 'Sub-Category';
    description @title: 'Description';
    statu       @title: 'Status';
    rating      @title: 'Rating';
    price       @title: 'Price'     @Measures.ISOCurrency: currency;
    currency    @title: 'Currency'  @Common.IsCurrency;
};

annotate myservice.Products with {
    product     @Common: {Text: productName, };
    category    @Common: {
        Text           : category.category,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Categories',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: category_ID,
                ValueListProperty: 'ID',
            }]
        },
    };
    subCategory @Common: {
        Text           : subCategory.subCategory,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_SubCategories',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: Category_ID,
                    ValueListProperty: 'category_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: subCategory_ID,
                    ValueListProperty: 'ID',
                }
            ]
        },
    };
    supplier    @Common: {
        Text           : supplier.supplierName,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Suppliers',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: supplier_ID,
                ValueListProperty: 'ID',
            }]
        },
    };
};

annotate myservice.Products with @(
    UI.SelectionFields      : [
        productName,
        category_ID,
        subCategory_ID,
        supplier_ID,
        statu_code,
    ],
    UI.HeaderInfo           : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: productName,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: product,
        }

    },

    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: product,
        },
        {
            $Type: 'UI.DataField',
            Value: category_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: subCategory_ID,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target: 'supplier/@Communication.Contact',
        },

        {
            $Type: 'UI.DataFieldForAnnotation',
            Value: supplier_ID,
        },

        {
            $Type             : 'UI.DataField',
            Value             : statu.name,
            Criticality       : statu.criticality,
            Label             : 'Status',
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
        {
            $Type             : 'UI.DataFieldForAnnotation',
            Target            : '@UI.DataPoint#Rating',
            Label             : 'Rating',
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : price,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
    ],
    UI.DataPoint #Rating    : {
        $Type        : 'UI.DataPointType',
        Value        : rating,
        Visualization: #Rating,
        Title        : 'Price',
    },

    UI.DataPoint #Price     : {
        $Type        : 'UI.DataPointType',
        Value        : price,
        Visualization: #Number,
    },

    UI.FieldGroup #Group_H_A: {
        $Type: 'UI.FieldGroupType',

        data : [
            {
                $Type: 'UI.DataField',
                Value: category_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: subCategory_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: supplier_ID,
            },
        ]
    },
    UI.FieldGroup #Group_H_B: {
        $Type: 'UI.FieldGroupType',

        data : [{
            $Type: 'UI.DataField',
            Value: Description,
        }]
    },
    UI.FieldGroup #Group_H_C: {
        $Type: 'UI.FieldGroupType',

        data : [{
            $Type      : 'UI.DataField',
            Value      : statu.name,
            criticality: statu.criticality,
        }]
    },
    UI.HeaderFacets         : [
        {
            $Type : 'UI.CollectionFacet',
            Target: 'UI.FieldGroup#Group_H_A',
        },
        {
            $Type : 'UI.CollectionFacet',
            Target: 'UI.FieldGroup#Group_H_B',
            Label : 'Product Descripction',
        },
        {
            $Type : 'UI.CollectionFacet',
            Target: 'UI.FieldGroup#Group_H_C',
            Label : 'Availability',
        },
        {
            $Type : 'UI.CollectionFacet',
            Target: 'UI.FieldGroup#price',
            Label : 'Price',
        },
    ],

    UI.FieldGroup #Group_B_A: {
        $Type: 'UI.FieldGroupType',

        data : [
            {
                $Type: 'UI.DataField',
                Value: productName,
            },
            {
                $Type: 'UI.DataField',
                Value: Descripction,
            },
            {
                $Type: 'UI.DataField',
                Value: category_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: subcategory_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: supplier_ID,
            },
        ]
    },
    UI.FieldGroup #Group_B_B: {
        $Type: 'UI.FieldGroupType',

        data : [
            {
                $Type: 'UI.DataField',
                Value: detail.width,
            },
            {
                $Type: 'UI.DataField',
                Value: detail.height,
            },
            {
                $Type: 'UI.DataField',
                Value: detail.depth,
            },
            {
                $Type: 'UI.DataField',
                Value: detail.weight,
            },
        ]
    },
    UI.Facets               : [{
        $Type : 'UI.CollectionFacet',
        Facets: [
            {
                $Type : 'UI.CollectionFacet',
                Target: 'UI.FieldGroup#Group_B_A',
                Label : 'Product Information',
            },
            {
                $Type : 'UI.CollectionFacet',
                Target: 'UI.FieldGroup#Group_B_B',
                Label : 'Product Detail',
            },
        ],
        Label : 'General Information',
    }, ],
);
