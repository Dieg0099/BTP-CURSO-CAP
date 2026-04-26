using {Products as myservice} from '../service';

annotate myservice.VH_SubCategories with {
    ID          @title: 'Sub-Categories';
    subCategory @title: 'Sub-Category';
    description @title: 'Description';
};

annotate myservice.VH_SubCategories with {
    ID @Common: {
        Text           : subCategory,
        TextArrangement: #TextOnly
    };
};