	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015438
sub_08015438: @ 0x08015438
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	adds r5, r2, #0
	adds r4, r3, #0
	movs r0, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sl, r1
	asrs r6, r0, #0x18
	movs r7, #1
	rsbs r7, r7, #0
	cmp r6, r7
	beq _080154A8
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #0x20]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	bl sub_0801DC04
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, r7
	bne _0801547C
	adds r0, r5, #0
	b _080154AE
_0801547C:
	ldr r0, _080154BC @ =gUnknown_03001470
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #5
	adds r4, r4, r0
	strh r5, [r4, #0x26]
	mov r0, r8
	lsls r2, r0, #0x18
	lsrs r2, r2, #0x18
	mov r0, sb
	adds r1, r6, #0
	bl sub_08015224
	ldrh r1, [r4, #0x12]
	movs r0, #2
	orrs r0, r1
	strh r0, [r4, #0x12]
	ldr r1, _080154C0 @ =gUnknown_0200E438
	movs r0, #0x4c
	muls r0, r5, r0
	adds r0, r0, r1
	strh r6, [r0, #0x38]
_080154A8:
	mov r1, sl
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
_080154AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080154BC: .4byte gUnknown_03001470
_080154C0: .4byte gUnknown_0200E438

