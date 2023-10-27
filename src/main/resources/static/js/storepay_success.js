$(function() {
            let token = $("meta[name='_csrf']").attr("content");
            let header = $("meta[name='_csrf_header']").attr("content");

            $(document).on('click', '.delbtn', function(e) {
                e.preventDefault();
                const row = $(this).closest('tr');
                const payNum = row.find('.delbtn').data('paynum');

                $.ajax({
                    url: 'success',
                    method: 'POST',
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    data: {
                        "payNum": payNum
                    },
                    dataType: 'json',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(data) {
                    	alert('온라인 결제건의 경우 즉시 취소 가능하며, 환불금액 반환은 약 4~7일 소요됩니다.');
                        window.location.reload();
                    },
                    error: function(error) {
                    	alert('온라인 결제건의 경우 즉시 취소 가능하며, 환불금액 반환은 약 4~7일 소요됩니다.');
                        window.location.reload();
                    }
                });
            });
        });