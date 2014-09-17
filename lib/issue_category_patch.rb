require_dependency 'issue_categories_controller'

# Patches Redmine's IssueCategory dynamically.
module IssueCategoryPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)

    base.send(:include, InstanceMethods)

    # Same as typing in the class 
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      
      #THE BEFORE_FILTER IS WHO GIVES THE AUTHORIZATION TO EXECUTE THE FUNCTION
      before_filter :authorize, :except => [:archive, :unarchive, :archived?, :unarchived?]
    end
  end
  
  module ClassMethods
    
  end
  
  module InstanceMethods
    
    def archive
      @category.archived = true
      if @category.save
        respond_to do |format|
          format.html do
            flash[:notice] = l(:plugin_notice_successful_archived)
            redirect_to_settings_in_projects
          end
          format.js
          format.api { render :action => 'show', :status => :created, :location => issue_category_path(@category) }
        end
      else
        respond_to do |format|
          format.html { render :action => 'new'}
          format.js   { render :action => 'new'}
          format.api { render_validation_errors(@category) }
        end
      end
    end
    
    def unarchive
      @category.archived = false
      if @category.save
        respond_to do |format|
          format.html do
            flash[:notice] = l(:plugin_notice_successful_archived)
            redirect_to_settings_in_projects
          end
          format.js
          format.api { render :action => 'show', :status => :created, :location => issue_category_path(@category) }
        end
      else
        respond_to do |format|
          format.html { render :action => 'new'}
          format.js   { render :action => 'new'}
          format.api { render_validation_errors(@category) }
        end
      end
    end
    
    def archived?
       @category.archived
    end

    def unarchived?
      !@category.archived
    end
    
  end
end

# Add module to Issue
IssueCategoriesController.send(:include, IssueCategoryPatch)