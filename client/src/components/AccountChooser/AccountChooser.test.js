import React from 'react';
import ReactDOM from 'react-dom';
import AccountChooser from './AccountChooser';

it('It should mount', () => {
    const div = document.createElement('div');
    ReactDOM.render(<AccountChooser/>, div);
    ReactDOM.unmountComponentAtNode(div);
});
