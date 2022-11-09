describe('jungle app', () => {
 
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("add product to the cart on main page", () => {
    cy.get(".products article").should("be.visible"); 
    cy.get("article button").then((btnArray) => {
      for ( const btn of btnArray){
        if(!btn.disabled){
          console.log('btn is not disabled');
          
          btn.click()
          break;
        }
      }
    })
    cy.contains("My Cart (1)")
  });


  it("add product to the cart in a individual page of the product", () => {
    cy.get(".products article").should("be.visible");
    cy.get('[alt="Void Fennel"]').click();
    cy.contains("Add").should('be.enabled').click();
    cy.contains("My Cart (1)")    
  });

})