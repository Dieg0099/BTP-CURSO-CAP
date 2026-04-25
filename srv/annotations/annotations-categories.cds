using {Products as myservice} from '../service';

annotate myservice.VH_Categories {
    ID           @title: 'Category';
    category     @title: 'Category';
    description  @title: 'Description';
};

annotate myservice.VH_Categories {

    ID @Common: {
        Text           : category,
        TextArrangement: #TextOnly,
    };
};
