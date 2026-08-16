	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004D90
sub_08004D90: @ 0x08004D90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r1, r5, #1
	cmp r4, #0
	bne _08004DA8
	ldr r0, _08004DA4 @ =gUnknown_08499578
	adds r1, #5
	b _08004DAC
	.align 2, 0
_08004DA4: .4byte gUnknown_08499578
_08004DA8:
	ldr r0, _08004DD0 @ =gUnknown_08499578
	adds r1, #7
_08004DAC:
	lsls r1, r1, #5
	adds r1, #3
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r1, r0, r1
	movs r0, #9
	bl sub_0801F2AC
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #2
	bl sub_08004DD4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004DD0: .4byte gUnknown_08499578

