	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BB44
sub_0804BB44: @ 0x0804BB44
	push {r4, r5, lr}
	ldr r5, _0804BB6C @ =gUnknown_08555850
	ldr r3, _0804BB70 @ =gUnknown_03004520
	ldrh r4, [r3]
	lsls r4, r4, #2
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #3
	adds r4, r4, r3
	adds r5, #0xc
	adds r4, r4, r5
	ldr r0, [r4]
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB6C: .4byte gUnknown_08555850
_0804BB70: .4byte gUnknown_03004520

