	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016EA4
sub_08016EA4: @ 0x08016EA4
	push {r4, r5, lr}
	ldr r4, _08016ED0 @ =gUnknown_02000000
	movs r0, #0
	adds r1, r4, #0
	bl sub_0801AC58
	cmp r0, #0
	bne _08016ECA
	movs r2, #0
	ldr r5, _08016ED4 @ =gUnknown_02028038
	adds r3, r4, #0
	adds r3, #8
_08016EBC:
	adds r0, r2, r5
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08016EBC
_08016ECA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016ED0: .4byte gUnknown_02000000
_08016ED4: .4byte gUnknown_02028038

