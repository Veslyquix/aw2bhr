	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804BFC0
sub_0804BFC0: @ 0x0804BFC0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r5, sp
	mov r1, sp
	bl sub_0801566C
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r5, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	ldr r1, _0804C074 @ =gUnknown_08551D0C
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r5, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	lsls r2, r4, #8
	ldr r3, _0804C078 @ =gUnknown_085D6A48
	ldr r0, _0804C07C @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #0x12]
	muls r0, r6, r0
	adds r2, r2, r0
	ldr r1, _0804C080 @ =0x000003FF
	adds r0, r1, #0
	ands r2, r0
	ldrh r1, [r5, #4]
	ldr r0, _0804C084 @ =0xFFFFFC00
	ands r0, r1
	orrs r0, r2
	strh r0, [r5, #4]
	ldr r1, _0804C088 @ =gUnknown_085523A4
	ldr r0, _0804C08C @ =gUnknown_0300450C
	ldrh r0, [r0]
	adds r4, r4, r0
	movs r0, #1
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #5]
	ldr r0, _0804C090 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C074: .4byte gUnknown_08551D0C
_0804C078: .4byte gUnknown_085D6A48
_0804C07C: .4byte gUnknown_03004580
_0804C080: .4byte 0x000003FF
_0804C084: .4byte 0xFFFFFC00
_0804C088: .4byte gUnknown_085523A4
_0804C08C: .4byte gUnknown_0300450C
_0804C090: .4byte gUnknown_03001FBC

