/**
 * 2013-2014 Froggy Commerce
 *
 * NOTICE OF LICENSE
 *
 * You should have received a licence with this module.
 * If you didn't buy this module on Froggy-Commerce.com, ThemeForest.net
 * or Addons.PrestaShop.com, please contact us immediately : contact@froggy-commerce.com
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to benefit the updates
 * for newer PrestaShop versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    Froggy Commerce <contact@froggy-commerce.com>
 * @copyright 2013-2014 Froggy Commerce
 * @license   Unauthorized copying of this file, via any medium is strictly prohibited
 */

$(document).ready(function() {

	// Add the debug box code to the page
	$('body').prepend(froggytoolbar_debug_box);

	// Set registered position to the debug box
	$('#froggytoolbar-debug-container').css('top', froggy_cookie.read('top') + 'px');
	$('#froggytoolbar-debug-container').css('left', froggy_cookie.read('left') + 'px');

	// Set the debug box draggable
	new dragObject('froggytoolbar-debug-container', 'froggytoolbar-debug-drag', null, null, null, null, function(){
		var position = $('#froggytoolbar-debug-container').position();
		froggy_cookie.write('left', position.left);
		froggy_cookie.write('top', position.top);
	});

	// Display debug box depending of the employee configuration
	if (froggy_cookie.read('enable') == 1)
		switchDebugBoxDisplay(1);

	// Switch debug box display when button is triggered
	$('#froggytoolbar-debug-option').click(function() {
		if ($('#froggytoolbar-debug-container').is(':visible'))
			switchDebugBoxDisplay(0);
		else
			switchDebugBoxDisplay(1);
		return false;
	});
});


function switchDebugBoxDisplay(action)
{
	if (action == 0)
	{
		$('#froggytoolbar-debug-container').fadeOut();
		$('#froggytoolbar-debug-button-label').text(froggytoolbar_debug_enable_label);
		$('.froggytoolbar-debug-module-name').fadeOut();
		$('.froggytoolbar-debug-module-block').css('border', '0px');
	}
	else
	{
		$('#froggytoolbar-debug-container').fadeIn();
		$('#froggytoolbar-debug-button-label').text(froggytoolbar_debug_disable_label);
		$('.froggytoolbar-debug-module-name').fadeIn();
		$('.froggytoolbar-debug-module-block').css('border', '1px ' + $('#froggytoolbar-debug-border-style').val() + ' #' + $('#froggytoolbar-debug-border-color').val());
	}
	froggy_cookie.write('enable', action);
}



var froggy_cookie = {
	"write" : function(name, value)
	{
		document.cookie = name+'='+value+'; path=/';

		return value;
	},
	"read" : function(name)
	{
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for (var i=0; i < ca.length; i++)
		{
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0)
				return c.substring(nameEQ.length, c.length);
		}
		return null;
	}
}




/*** JS LIB ***/

function hookEvent(element, eventName, callback)
{
	if(typeof(element) == "string")
		element = document.getElementById(element);
	if(element == null)
		return;
	if(element.addEventListener)
	{
		element.addEventListener(eventName, callback, false);
	}
	else if(element.attachEvent)
		element.attachEvent("on" + eventName, callback);
}

function unhookEvent(element, eventName, callback)
{
	if(typeof(element) == "string")
		element = document.getElementById(element);
	if(element == null)
		return;
	if(element.removeEventListener)
		element.removeEventListener(eventName, callback, false);
	else if(element.detachEvent)
		element.detachEvent("on" + eventName, callback);
}

function cancelEvent(e)
{
	e = e ? e : window.event;
	if(e.stopPropagation)
		e.stopPropagation();
	if(e.preventDefault)
		e.preventDefault();
	e.cancelBubble = true;
	e.cancel = true;
	e.returnValue = false;
	return false;
}

function Position(x, y)
{
	this.X = x;
	this.Y = y;

	this.Add = function(val)
	{
		var newPos = new Position(this.X, this.Y);
		if(val != null)
		{
			if(!isNaN(val.X))
				newPos.X += val.X;
			if(!isNaN(val.Y))
				newPos.Y += val.Y
		}
		return newPos;
	}

	this.Subtract = function(val)
	{
		var newPos = new Position(this.X, this.Y);
		if(val != null)
		{
			if(!isNaN(val.X))
				newPos.X -= val.X;
			if(!isNaN(val.Y))
				newPos.Y -= val.Y
		}
		return newPos;
	}

	this.Min = function(val)
	{
		var newPos = new Position(this.X, this.Y)
		if(val == null)
			return newPos;

		if(!isNaN(val.X) && this.X > val.X)
			newPos.X = val.X;
		if(!isNaN(val.Y) && this.Y > val.Y)
			newPos.Y = val.Y;

		return newPos;
	}

	this.Max = function(val)
	{
		var newPos = new Position(this.X, this.Y)
		if(val == null)
			return newPos;

		if(!isNaN(val.X) && this.X < val.X)
			newPos.X = val.X;
		if(!isNaN(val.Y) && this.Y < val.Y)
			newPos.Y = val.Y;

		return newPos;
	}

	this.Bound = function(lower, upper)
	{
		var newPos = this.Max(lower);
		return newPos.Min(upper);
	}

	this.Check = function()
	{
		var newPos = new Position(this.X, this.Y);
		if(isNaN(newPos.X))
			newPos.X = 0;
		if(isNaN(newPos.Y))
			newPos.Y = 0;
		return newPos;
	}

	this.Apply = function(element)
	{
		if(typeof(element) == "string")
			element = document.getElementById(element);
		if(element == null)
			return;
		if(!isNaN(this.X))
			element.style.left = this.X + 'px';
		if(!isNaN(this.Y))
			element.style.top = this.Y + 'px';
	}
}

function absoluteCursorPosition(eventObj)
{
	eventObj = eventObj ? eventObj : window.event;

	if(isNaN(window.scrollX))
		return new Position(eventObj.clientX + document.documentElement.scrollLeft + document.body.scrollLeft,
			eventObj.clientY + document.documentElement.scrollTop + document.body.scrollTop);
	else
		return new Position(eventObj.clientX + window.scrollX, eventObj.clientY + window.scrollY);
}

function dragObject(element, attachElement, lowerBound, upperBound, startCallback, moveCallback, endCallback, attachLater)
{
	if(typeof(element) == "string")
		element = document.getElementById(element);
	if(element == null)
		return;

	if(lowerBound != null && upperBound != null)
	{
		var temp = lowerBound.Min(upperBound);
		upperBound = lowerBound.Max(upperBound);
		lowerBound = temp;
	}

	var cursorStartPos = null;
	var elementStartPos = null;
	var dragging = false;
	var listening = false;
	var disposed = false;

	function dragStart(eventObj)
	{
		if(dragging || !listening || disposed) return;
		dragging = true;

		if(startCallback != null)
			startCallback(eventObj, element);

		cursorStartPos = absoluteCursorPosition(eventObj);

		elementStartPos = new Position(parseInt(element.style.left), parseInt(element.style.top));

		elementStartPos = elementStartPos.Check();

		hookEvent(document, "mousemove", dragGo);
		hookEvent(document, "mouseup", dragStopHook);

		return cancelEvent(eventObj);
	}

	function dragGo(eventObj)
	{
		if(!dragging || disposed) return;

		var newPos = absoluteCursorPosition(eventObj);
		newPos = newPos.Add(elementStartPos).Subtract(cursorStartPos);
		newPos = newPos.Bound(lowerBound, upperBound)
		newPos.Apply(element);
		if(moveCallback != null)
			moveCallback(newPos, element);

		return cancelEvent(eventObj);
	}

	function dragStopHook(eventObj)
	{
		dragStop();
		return cancelEvent(eventObj);
	}

	function dragStop()
	{
		if(!dragging || disposed) return;
		unhookEvent(document, "mousemove", dragGo);
		unhookEvent(document, "mouseup", dragStopHook);
		cursorStartPos = null;
		elementStartPos = null;
		if(endCallback != null)
			endCallback(element);
		dragging = false;
	}

	this.Dispose = function()
	{
		if(disposed) return;
		this.StopListening(true);
		element = null;
		attachElement = null
		lowerBound = null;
		upperBound = null;
		startCallback = null;
		moveCallback = null
		endCallback = null;
		disposed = true;
	}

	this.StartListening = function()
	{
		if(listening || disposed) return;
		listening = true;
		hookEvent(attachElement, "mousedown", dragStart);
	}

	this.StopListening = function(stopCurrentDragging)
	{
		if(!listening || disposed) return;
		unhookEvent(attachElement, "mousedown", dragStart);
		listening = false;

		if(stopCurrentDragging && dragging)
			dragStop();
	}

	this.IsDragging = function(){ return dragging; }
	this.IsListening = function() { return listening; }
	this.IsDisposed = function() { return disposed; }

	if(typeof(attachElement) == "string")
		attachElement = document.getElementById(attachElement);
	if(attachElement == null)
		attachElement = element;

	if(!attachLater)
		this.StartListening();
}
