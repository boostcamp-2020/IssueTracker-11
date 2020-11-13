import React, { useState, useEffect } from 'react';
import Span from '@atoms/Span.js';
import DropDown from '../organisms/DropDown';

const LabelDropDown = () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        const getusers = () => {
            fetch('http://49.50.160.103:3000/users')
                .then((res) => res.json())
                .then((res) => {
                    setUsers(res.data);
                });
        };
        getusers();
    }, []);
    if (!users) return <div></div>;

    return (
        <div style={{ border: '1px solid black', height: '100%' }}>
            <DropDown items={users} subject="Assignees" style={{ float: 'right' }}></DropDown>
        </div>
    );
};

export default LabelDropDown;
