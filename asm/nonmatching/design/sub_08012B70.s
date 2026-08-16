	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012B70
sub_08012B70: @ 0x08012B70
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldrh r0, [r5]
	ldrb r6, [r5]
	lsrs r7, r0, #8
	lsrs r2, r2, #0xf
	adds r2, r4, r2
	lsrs r3, r3, #0xa
	adds r2, r2, r3
	adds r5, #2
	movs r1, #0
	cmp r1, r7
	bhs _08012BC0
_08012B98:
	lsls r0, r1, #6
	adds r4, r2, r0
	movs r3, #0
	adds r1, #1
	cmp r3, r6
	bhs _08012BB8
_08012BA4:
	ldrh r0, [r5]
	add r0, ip
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r6
	blo _08012BA4
_08012BB8:
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r7
	blo _08012B98
_08012BC0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

