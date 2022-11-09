describe('jungle app', () => {
 
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("show the product details when you click", () => {
    cy.get('[alt="Cliff Collard"]').click()
  });

})