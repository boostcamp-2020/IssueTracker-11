import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Button } from '@atoms/Button.js';

const Header = ({ sendDataToParent }) => {
    const [buttonText, setButtonText] = useState('New issue');

    const setLabel = () => {
        setButtonText('new Label');
        sendDataToParent('none');
    };
    const setMilestone = () => {
        setButtonText('new milestone');
        sendDataToParent('none');
    };
    const setCreateButton = () => {};

    return (
        <header style={{ display: 'flex', width: 'auto' }}>
            <Link to="/label">
                <Button
                    radius="true"
                    backgroundColor="white"
                    border="true"
                    fontWeight="bold"
                    text="Labels"
                    width="120px"
                    marginRight="5px"
                    onClick={setLabel}
                >
                    <div
                        style={{
                            justifyContent: 'center',
                            alignItems: 'center',
                            marginLeft: '10px',
                            backgroundColor: '#eeeeee',
                            width: '20%',
                            height: '60%',
                            paddingTop: '3px',
                            borderRadius: '50%',
                            fontWeight: '700',
                        }}
                    ></div>
                </Button>
            </Link>
            <Link to="/milestone">
                <Button
                    radius="true"
                    backgroundColor="white"
                    border="true"
                    fontWeight="bold"
                    text="Milestones"
                    width="120px"
                    marginRight="20px"
                    onClick={setMilestone}
                >
                    <div
                        style={{
                            justifyContent: 'center',
                            alignItems: 'center',
                            marginLeft: '10px',
                            backgroundColor: '#eeeeee',
                            width: '20%',
                            height: '60%',
                            paddingTop: '3px',
                            borderRadius: '50%',
                            fontWeight: '700',
                        }}
                    >
                        5
                    </div>
                </Button>
            </Link>
            <Link to="/issuenote">
                <Button
                    radius="true"
                    fontWeight="bold"
                    text={buttonText}
                    backgroundColor="#28a745"
                    fontColor="white"
                ></Button>
            </Link>
        </header>
    );
};

export default Header;
