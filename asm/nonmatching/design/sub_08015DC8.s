	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015DC8
sub_08015DC8: @ 0x08015DC8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08015DF8 @ =gUnknown_03001470
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #5
	adds r5, r2, #4
	adds r5, r4, r5
	ldr r0, [r5]
	ldr r1, [r0]
	adds r4, r4, r2
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r5]
	adds r0, #8
	str r0, [r5]
	ldr r0, [r4]
	cmp r0, #0
	bne _08015DFC
	movs r0, #0
	b _08015DFE
	.align 2, 0
_08015DF8: .4byte gUnknown_03001470
_08015DFC:
	movs r0, #1
_08015DFE:
	pop {r4, r5}
	pop {r1}
	bx r1

