	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012FE8
sub_08012FE8: @ 0x08012FE8
	push {lr}
	ldr r0, [r0, #0x20]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08012FFE
	ldr r0, _08013004 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08012FFE:
	pop {r0}
	bx r0
	.align 2, 0
_08013004: .4byte gUnknown_03001FBC

