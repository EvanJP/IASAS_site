module ApplicationHelper
    def full_title(page_title = '')
        base_title = "TAS Track and Field 2016"
        if page_title.empty?
            base_title
        else
            base_title + " " + page_title
        end
    end
end
