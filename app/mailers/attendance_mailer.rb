class AttendanceMailer < ApplicationMailer
    default from: 'dav-ngu31@hotmail.fr'
 
  def participation_confirmation(attendance)
    @attendance = attendance
    @user = User.find(@attendance.participant_id) #sert pour les views du mailers
    @event = Event.find(@attendance.event_id)  #sert pour les views du mailers

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Votre Réservation est confirmée.') 
  end
end
