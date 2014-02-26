package com.alvinsj.pindah

import android.widget.TextView
import android.app.Activity
import org.json.JSONObject
import org.apache.http.HttpEntity
import com.stepsdk.android.api.APIRequest
import com.stepsdk.android.api.APIClient
import com.stepsdk.android.api.JSONRequestHandler

class HomeActivity < Activity
  def onCreate(state)
    super state
    setContentView R.layout.main

    @text_view = TextView findViewById(R.id.text_view)
    @text_view.setText "alvin is here"

    APIRequest.
      new(APIClient.new(self), "http://ip.jsontest.com/", APIRequest.GET).
      start(RequestHandler.new(@text_view))
  end
  
  class RequestHandler < JSONRequestHandler
    def initialize(text_view:TextView)
      super()
      @text_view = text_view
    end

    def before
      @text_view.setText "Loading..."
    end

    def after 
      @text_view.setText "Done"
      @text_view.setText "#{@response}"
    end

    def onException(e:Exception)
      @response = e
    end

    def onResponse(response:HttpEntity, jsonResponse:JSONObject)
      @response = jsonResponse
    end

  end
  
end
