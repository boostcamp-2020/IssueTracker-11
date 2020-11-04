import React from 'react';

export default function ImageUpload() {
    function uploadImgPreview(event) {
        let file = event.target.files[0];
        let reader = new FileReader();

        reader.onload = function () {
            // 실제 업로드를 위한 로직 구현 필요
            // e.g.) upload(reader.result);
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    return (
        <div className="Test">
            <div style={{ backgroundColor: '#efefef', width: '150px', height: '150px' }}></div>
            <div>
                <input type="file" name="imgFile" id="imgFile" onChange={uploadImgPreview} />
            </div>
        </div>
    );
}
