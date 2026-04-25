using {Products as myservice} from '../service';

annotate myservice.VH_SubCategories {
    ID          @title: 'Sub-Category';
    subCategory @title: 'Sub-Category';
    description @title: 'Description';
};

annotate myservice.VH_SubCategories {

    ID @Common: {
        Text           : subCategory,
        TextArrangement: #TextOnly,
    };
};
