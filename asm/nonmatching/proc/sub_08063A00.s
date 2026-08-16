	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063A00
sub_08063A00: @ 0x08063A00
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0x1d
	ldr r0, _08063A2C @ =gUnknown_03001470
	movs r1, #0xae
	lsls r1, r1, #4
	adds r4, r0, r1
_08063A10:
	ldr r0, [r4]
	cmp r0, r7
	bne _08063A1C
	adds r0, r4, #0
	bl _call_via_r6
_08063A1C:
	subs r4, #0x60
	subs r5, #1
	cmp r5, #0
	bge _08063A10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063A2C: .4byte gUnknown_03001470

