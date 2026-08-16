	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801113C
sub_0801113C: @ 0x0801113C
	push {lr}
	adds r1, r0, #0
	ldr r3, _08011150 @ =gUnknown_03001FFC
	ldrh r0, [r3]
	cmp r0, #0
	bne _08011154
	adds r0, r1, #0
	bl Proc_End
	b _08011176
	.align 2, 0
_08011150: .4byte gUnknown_03001FFC
_08011154:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _0801116E
	movs r0, #0
	strh r0, [r2]
_0801116E:
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3]
_08011176:
	pop {r0}
	bx r0
	.align 2, 0

