<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<style>
    .modal {
        outline: none;
        position: absolute;
        background-color: rgba(0, 0, 0, .5);
        top: 0;
        left: 0;
        right:0;
        bottom: 0;
        display:none;
        margin: auto;
    }
    .myClass{
        width: 300px;
        height: 100px;
        background: #fff;
        position: absolute;
        top: 50px;
        left: calc(50% - 150px);
        border-radius: 10px;
    }
    .myClose{
        position: absolute;
        right: 5px;
        top: 5px;
        border: none;
        background: none;
        font-size: 25px;
        color: #ccc;
        outline: none;
    }
    .myBtn{
        position: absolute;
        right: 30px;
        top: 60px;
    }
    .myDel{
        font-size: 16px;
        padding-top: 27px;
        padding-left: 40px;
    }
    .btn{
        margin: 0 3px;
        height: 25px;
        text-align: center;
        padding: 5px 9px;
        border: 1px solid #eee;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
    }
    .myBtnSure{
        margin: 0 3px;
        height: 29px;
        text-align: center;
        padding: 5px 9px;
        border: 1px solid #eee;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        background: #428bca;
        color: #fff;
        outline: none;
    }
</style>

<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog deleteConfirmModalDiv myClass">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close myClose" type="button"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title myDel" >确认删除？</h4>
            </div>
            <div class="modal-footer myBtn">
                <span data-dismiss="modal" class="btn">关闭</span>
                <%--<span class="deleteConfirmButton btn" id="submit" style="background: #428bca;color:#fff;">确认</span>--%>
                <button class="btn myBtnSure deleteConfirmButton" id="submit" type="button">确认</button>
            </div>
        </div>
    </div>
</div>