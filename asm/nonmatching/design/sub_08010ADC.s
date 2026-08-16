	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010ADC
sub_08010ADC: @ 0x08010ADC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
	ldr r7, _08010B28 @ =gUnknown_0808D8A0
_08010AE6:
	ldr r0, [r7]
	lsls r1, r4, #1
	adds r0, r1, r0
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r6, r0
	cmp r2, #0
	blt _08010B1A
	ldr r0, _08010B2C @ =gUnknown_08499590
	ldr r3, [r0]
	ldrh r0, [r3]
	cmp r2, r0
	bge _08010B1A
	ldr r0, _08010B30 @ =gUnknown_08488986
	adds r0, r1, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r5, r0
	cmp r1, #0
	blt _08010B1A
	ldrh r3, [r3, #2]
	cmp r1, r3
	bge _08010B1A
	adds r0, r2, #0
	bl sub_08010664
_08010B1A:
	adds r4, #1
	cmp r4, #4
	ble _08010AE6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010B28: .4byte gUnknown_0808D8A0
_08010B2C: .4byte gUnknown_08499590
_08010B30: .4byte gUnknown_08488986

