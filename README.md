
# MindYourHealth
My application is for patients and doctors. It lets those who dont have active access to
health care get a virtual pre-diagnostic from a volunteering health professional.
Professionals can include excelling medical students and doctors. This way patients can
have an early warning to someting serious or have peace of mind without getting a
scary diagnostic from Google. The way this works is when a user login the their profile,
they will be able to send their symptoms to a health professional. This professional will
be able to send a diagnostic back to the user.

using api: https://apimedic.com/

Port: csc415-server29.hpc.tcnj.edu:3000
 
## Technology Stack

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
-**ApiMedic:** https://apimedic.com/
- **GitHub:** version control 
  

### Technology Versions

- Ruby: 3.0.2
- Postgres : /usr/pgsql-14/bin/postgres


## File Path 

- `/home/student1/vm-csc415/MindYourHealth-24-AE/src`

## Getting Started

To get started with MindYourHealth, follow these steps:

1. Clone this repository.
2. Install dependencies using `bundle install`.
3. Set up the database with `rails db:create` and `rails db:migrate`.
4. Start the Rails server with ` cd vm-csc415/ MindyourHealth/src rails s --binding 10.18.6.29`.

## How to Run

1. Check your IP address:

    ```bash
    ip addr show eth0
    ```

2. Start the Rails server:

    ```bash
    rails s --binding xxx.xxx.xxx.xxx
    ```

## Install Ruby

You can use the following script to install Ruby:

```bash
./installruby.sh
```
## Diagrams

- Use case Diagram <img width="634" alt="Screenshot 2024-04-08 at 9 28 43 PM" src="https://github.com/TCNJ-SE/MindYourHealth-24-AE/assets/90947905/c652c604-775a-4adb-90fc-65c70463c982">

- State Diagram<img width="1335" alt="Screenshot 2024-04-08 at 9 39 44 PM" src="https://github.com/TCNJ-SE/MindYourHealth-24-AE/assets/90947905/66712bbe-346b-4768-bfef-410965e5b202">

- System Sequence Diagram<img width="1335" alt="Screenshot 2024-04-08 at 9 37 33 PM" src="https://github.com/TCNJ-SE/MindYourHealth-24-AE/assets/90947905/c2bea5c4-75f5-4a1b-84e1-503bb1dc60e2">
- Class Diagram <img width="1279" alt="Screenshot 2024-04-08 at 9 43 56 PM" src="https://github.com/TCNJ-SE/MindYourHealth-24-AE/assets/90947905/f7284d39-2359-48bb-b650-487ad7084780">
