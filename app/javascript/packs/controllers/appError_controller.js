import {Controller} from 'stimulus'

export default class extends Controller{

    handleDeveloperForm(){
        const form = this.targets.find('developerFormButton');
        form.click()
    }
    handleStatusForm(){
        const form = this.targets.find('statusFormButton');
          form.click()

    }

}