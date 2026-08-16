	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065060
sub_08065060: @ 0x08065060
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	ldrh r1, [r4, #0x3a]
	adds r0, r0, r1
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x2a]
	adds r1, r1, r0
	strh r1, [r4, #0x2a]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08065086
	ldr r0, _08065094 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08065086:
	adds r0, r4, #0
	bl sub_08064E5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065094: .4byte gUnknown_03001FBC

