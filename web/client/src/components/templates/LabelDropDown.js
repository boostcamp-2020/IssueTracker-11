import React, { useState, useEffect } from 'react';
import DropDown from '../organisms/DropDown';

const LabelDropDown = ({ children }) => {
    const [labels, setLabels] = useState(null);

    useEffect(() => {
        const getLabels = () => {
            fetch('http://49.50.160.103:3000/labels')
                .then((res) => res.json())
                .then((res) => {
                    setLabels(res.data);
                });
        };
        getLabels();
    }, []);
    if (!labels) return <div></div>;

    return (
        <DropDown items={labels} subject="Labels" style={{ float: 'right' }}>
            {children}
        </DropDown>
    );
};

export default LabelDropDown;
