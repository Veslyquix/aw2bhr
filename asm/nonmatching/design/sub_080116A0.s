	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080116A0
sub_080116A0: @ 0x080116A0
	push {lr}
	ldr r0, _080116D0 @ =gUnknown_084892C4
	bl Proc_Find
	cmp r0, #0
	bne _080116E0
	ldr r0, _080116D4 @ =gUnknown_0848929C
	bl Proc_Find
	cmp r0, #0
	bne _080116E0
	ldr r0, _080116D8 @ =gUnknown_0848925C
	bl Proc_Find
	cmp r0, #0
	bne _080116E0
	ldr r0, _080116DC @ =gUnknown_0848923C
	bl Proc_Find
	cmp r0, #0
	bne _080116E0
	movs r0, #0
	b _080116E2
	.align 2, 0
_080116D0: .4byte gUnknown_084892C4
_080116D4: .4byte gUnknown_0848929C
_080116D8: .4byte gUnknown_0848925C
_080116DC: .4byte gUnknown_0848923C
_080116E0:
	movs r0, #1
_080116E2:
	pop {r1}
	bx r1
	.align 2, 0

