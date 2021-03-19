import React from 'react';
import ReactDOM from 'react-dom';
import StarRatingDialog from './StarRatingDialog';

it('It should mount', () => {
    const div = document.createElement('div');
    ReactDOM.render(<StarRatingDialog/>, div);
    ReactDOM.unmountComponentAtNode(div);
});
