expect = chai.expect

chocolat = $('<div />').Chocolat({
    backgroundClose: false,
    images         : [
        {src : '../images/chocolat-1.jpg', title : 'You can zoom in the image'},
        {src : '../images/chocolat-2.jpg', title : 'You can zoom in the image'}, 
        {src : '../images/chocolat-3.jpg', title : 'You can zoom in the image'},
    ],
}).data('chocolat')


describe "Chocolat", ->
    describe "Opening", ->

        it "should call markup function and create markup", ->
            inst = $('#example0').Chocolat({
                loop : true,
                container : $('#container'),
                fullScreen: false
            }).data('chocolat');

            spyMarkup = sinon.spy(inst, 'markup')

            $('#example0').find('.chocolat-image').first().trigger('click')

            expect(spyMarkup.calledOnce).to.be.true
            expect($('#container').find('.chocolat-wrapper').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-overlay').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-loader').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-content').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-top').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-bottom').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-left').length).to.equal(1)
            expect($('#container .chocolat-wrapper').find('.chocolat-right').length).to.equal(1)
            expect($('#container .chocolat-top').find('.chocolat-fullscreen').length).to.equal(1)
            expect($('#container .chocolat-top').find('.chocolat-pagination').length).to.equal(1)
            expect($('#container .chocolat-top').find('.chocolat-close').length).to.equal(1)
            expect($('#container .chocolat-bottom').find('.chocolat-description').length).to.equal(1)
            expect($('#container .chocolat-content').find('.chocolat-img').length).to.equal(1)

        it "should call init function", ->

            inst = $('#example0').Chocolat({
                loop : true,
                container : $('#container'),
                fullScreen: false
            }).data('chocolat');

            spyInit = sinon.spy(inst, 'init')

            $('#example0').find('.chocolat-image').first().trigger('click')

            expect(spyInit.calledOnce).to.be.true
            expect(spyInit.calledWithExactly(0)).to.be.true

    describe "API", ->

        it "should have a open method", ->
            expect(typeof chocolat.api().open).to.equal("function")

        it "should have a close method", ->
            expect(typeof chocolat.api().close).to.equal("function")

        it "should have a next method", ->
            expect(typeof chocolat.api().next).to.equal("function")

        it "should have a prev method", ->
            expect(typeof chocolat.api().prev).to.equal("function")

        it "should have a goto method", ->
            expect(typeof chocolat.api().goto).to.equal("function")

        it "should have a current method", ->
            expect(typeof chocolat.api().current).to.equal("function")

        it "should have a place method", ->
            expect(typeof chocolat.api().place).to.equal("function")

        it "should have a set method", ->
            expect(typeof chocolat.api().set).to.equal("function")

        it "should have a get method", ->
            expect(typeof chocolat.api().get).to.equal("function")

        it "should have a getElem method", ->
            expect(typeof chocolat.api().getElem).to.equal("function")

