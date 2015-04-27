import React from 'react';

class Hello extends React.Component {
    render () {
        return <p>hello world</p>;
    }
}

React.render(<Hello/>, document.querySelector('#app'));
