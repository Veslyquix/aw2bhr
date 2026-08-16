	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015224
sub_08015224: @ 0x08015224
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r6, _08015274 @ =gUnknown_03001FBC
	ldrh r1, [r6]
	mov sb, r1
	strh r4, [r6]
	lsls r5, r4, #0x18
	lsrs r1, r5, #0x18
	mov r8, r1
	bl sub_080151B0
	ldr r1, _08015278 @ =gUnknown_03001470
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0, #0x12]
	mov r0, r8
	bl sub_08015A30
	mov r0, sb
	strh r0, [r6]
	asrs r5, r5, #0x18
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08015274: .4byte gUnknown_03001FBC
_08015278: .4byte gUnknown_03001470

